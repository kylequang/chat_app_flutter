# chat_app

<details>
    <summary><font size="5">Generator</font> </summary>


### Json to model generator

1. Create/copy `.json` files into `lib/json/`
2. Run the following command<br/>

   ```sh
   flutter pub run json_to_model -s lib/json -o lib/app/data/model
   ```

3. Use the generated models in `lib/app/data/model/`<br/>
   [Package Docs](https://pub.dev/packages/json_to_model)

### Assets generator

1. Copy icon/images files into `assets/icons`, `assets/images`, `assets/fonts`, ...

   ```
   -- assets
     -- icons
       -- an_icon.svg
     -- images
       -- an_image.png
     -- fonts
       -- Nunito-Regular.ttf
   ```

2. Run the following command<br/>

   ```sh
   flutter packages pub run build_runner build
   ```

3. Usage:<br/>

   ```dart
 
   // Display a svg
   Assets.icons.anIcon.svg(),
   // Display an image
   Assets.images.anImage.image()
   // Using font
   Text('Hi', style: TextStyle(fontFamily: FontFamily.nunito))
   ```

   > **_NOTE:_** All of the assets have to be defined in pubspec.yaml
   > [Package Docs](https://pub.dev/packages/flutter_gen)

</details>


### Video ###


https://user-images.githubusercontent.com/67398186/183606928-5892af88-1697-4d5d-a10e-e666e5f5457f.mp4

