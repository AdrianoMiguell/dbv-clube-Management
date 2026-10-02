import 'package:flutter/material.dart';

class CardButtonWidget extends StatelessWidget {
  final Widget title;
  final Widget? description;
  final Color background;
  final VoidCallback? onTap;
  final Widget? icon;

  const CardButtonWidget({
    super.key,
    required this.title,
    this.description,
    this.background = const Color.fromARGB(255, 255, 255, 252),
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // 👈 faz o cursor mudar
      child: Card(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: Colors.black12,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, color: Colors.black87),
                        child: title,
                      ),
                      if (description != null) ...[
                        const SizedBox(height: 4),
                        DefaultTextStyle(
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: Colors.black87),
                          child: description!,
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: 24),
                if (icon != null) ...[
                  icon ?? Container(),
                  const SizedBox(width: 15),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
