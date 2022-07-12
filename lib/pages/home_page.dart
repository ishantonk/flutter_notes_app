import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  'Notes',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            const SizedBox(height: 96),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 2),
                IconButton(
                  icon: const Icon(CupertinoIcons.doc_text_search),
                  onPressed: () {},
                ),
                const SizedBox(width: 2),
                IconButton(
                  icon: const Icon(CupertinoIcons.ellipsis_vertical),
                  onPressed: () {},
                ),
                const SizedBox(width: 2),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Note $index',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // title: Text('Note $index'),
                    // subtitle: const Text('This is a note'),
                    // trailing: IconButton(
                    // icon: const Icon(CupertinoIcons.delete),
                    // onPressed: () {},
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(CupertinoIcons.add),
        ),
      ),
    );
  }
}
