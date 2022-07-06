import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';

class _NavigationBody extends InheritedWidget {
  /// Part of the fluent_ui lib

  const _NavigationBody({
    Key? key,
    required Widget child,
    required this.displayMode,
    required this.minimalPaneOpen,
  }) : super(key: key, child: child);

  final PaneDisplayMode? displayMode;
  final bool minimalPaneOpen;

  static _NavigationBody? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_NavigationBody>();
  }

  @override
  bool updateShouldNotify(_NavigationBody oldWidget) {
    return oldWidget.displayMode != displayMode ||
        oldWidget.minimalPaneOpen != minimalPaneOpen;
  }
}

class PaneItemWidget extends PaneItem {
  /// Part of the fluent_ui lib with some changes

  final Widget title;
  final Widget icon;
  // final bool isSelected;

  PaneItemWidget({required this.title, required this.icon})
      : super(icon: icon, title: title);

  @override
  Widget build(
    BuildContext context,
    bool selected,
    VoidCallback? onPressed, {
    PaneDisplayMode? displayMode,
    bool showTextOnTop = true,
    bool? autofocus,
  }) {
    final PaneDisplayMode mode = displayMode ??
        _NavigationBody.maybeOf(context)?.displayMode ??
        PaneDisplayMode.minimal;
    assert(displayMode != PaneDisplayMode.auto);
    final bool isTop = mode == PaneDisplayMode.top;
    final bool isCompact = mode == PaneDisplayMode.compact;
    final bool isOpen =
        [PaneDisplayMode.open, PaneDisplayMode.minimal].contains(mode);
    final NavigationPaneThemeData theme = NavigationPaneTheme.of(context);

    final String titleText = (title as Text).data ?? '';

    return Consumer<ThemeModel>(builder: (context, model, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: isSelected ? model.secondaryColor : Colors.transparent,
        ),
        key: itemKey,
        height: !isTop ? 36.0 : null,
        width: isCompact ? 50 : null,
        margin: const EdgeInsets.only(right: 6.0, left: 6.0, bottom: 4.0),
        alignment: Alignment.center,
        child: HoverButton(
          autofocus: autofocus ?? this.autofocus,
          focusNode: focusNode,
          onPressed: onPressed,
          builder: (context, states) {
            final textStyle = selected
                ? theme.selectedTextStyle?.resolve(states)
                : theme.unselectedTextStyle?.resolve(states);
            final textResult = titleText.isNotEmpty
                ? Padding(
                    padding: theme.labelPadding ?? EdgeInsets.zero,
                    child: Text(titleText, style: textStyle),
                  )
                : const SizedBox.shrink();
            Widget child = Flex(
              direction: isTop ? Axis.vertical : Axis.horizontal,
              textDirection: isTop ? TextDirection.ltr : TextDirection.rtl,
              mainAxisAlignment: isTop || !isOpen
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.end,
              children: [
                if (isOpen && infoBadge != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: infoBadge!,
                  ),
                if (isOpen) Expanded(child: textResult),
                () {
                  final icon = Padding(
                    padding: theme.iconPadding ?? EdgeInsets.zero,
                    child: IconTheme.merge(
                      data: IconThemeData(
                        color: (selected
                                ? theme.selectedIconColor?.resolve(states)
                                : theme.unselectedIconColor?.resolve(states)) ??
                            textStyle?.color,
                        size: 16.0,
                      ),
                      child: Center(
                        child: Stack(clipBehavior: Clip.none, children: [
                          this.icon,
                          // Show here if it's not on top and not open
                          if (infoBadge != null && !isTop && !isOpen)
                            Positioned(
                              right: -8,
                              top: -8,
                              child: infoBadge!,
                            ),
                        ]),
                      ),
                    ),
                  );
                  if (isOpen) {
                    return icon;
                  }
                  return icon;
                }(),
              ],
            );
            if (isTop && showTextOnTop) {
              child = Row(mainAxisSize: MainAxisSize.min, children: [
                child,
                textResult,
              ]);
            }
            if (isTop && infoBadge != null) {
              child = Stack(children: [
                child,
                Positioned(
                  top: 0,
                  right: 0,
                  child: infoBadge!,
                ),
              ]);
            }
            child = AnimatedContainer(
              duration: theme.animationDuration ?? Duration.zero,
              curve: theme.animationCurve ?? standardCurve,
              decoration: BoxDecoration(
                color: () {
                  final ButtonState<Color?> tileColor = theme.tileColor ??
                      ButtonState.resolveWith((states) {
                        if (isTop) return Colors.transparent;
                        return ButtonThemeData.uncheckedInputColor(
                          FluentTheme.of(context),
                          states,
                        );
                      });
                  final newStates = states.toSet()
                    ..remove(ButtonStates.disabled);
                  return tileColor.resolve(
                    selected ? {ButtonStates.hovering} : newStates,
                  );
                }(),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: child,
            );
            child = Semantics(
              label: titleText,
              selected: selected,
              child: FocusBorder(
                child: child,
                focused: states.isFocused,
                renderOutside: false,
              ),
            );
            if (((isTop && !showTextOnTop) || isCompact) &&
                titleText.isNotEmpty &&
                !states.isDisabled) {
              return Tooltip(
                message: titleText,
                style: TooltipThemeData(
                  textStyle: title is Text ? (title as Text).style : null,
                ),
                child: child,
              );
            }
            return child;
          },
        ),
      );
    });
  }
}
