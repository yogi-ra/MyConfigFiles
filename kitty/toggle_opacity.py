from kitty.boss import Boss
from kittens.tui.handler import result_handler

import kitty.fast_data_types as f


def main(args: list[str]) -> str:
    pass


@result_handler(no_ui=True)
def handle_result(
    args: list[str], answer: str, target_window_id: int, boss: Boss
) -> None:
    os_window_id = f.current_focused_os_window_id()
    if os_window_id is None:
        return

    current_opacity = f.background_opacity_of(os_window_id)

    # Define your toggle values
    new_opacity = 1.0 if current_opacity < 1.0 else 0.8

    w = None
    target_window = None

    for w in boss.window_id_map.values():
        if w.os_window_id == os_window_id:
            target_window = w
            break

    boss.call_remote_control(
        target_window,
        ("set-background-opacity", str(new_opacity)),
    )
