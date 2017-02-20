# cocoa-close-pixelate

[![License: MIT](https://img.shields.io/badge/License-MIT-5BA7E9.svg)](https://opensource.org/licenses/MIT) [![Bintray](https://img.shields.io/cocoapods/v/ClosePixelate.svg)]()

This simple library allows you to easily create and combine various pixelation effects.

Based on a wonderful script by David DeSandro: [close-pixelate.desandro.com](http://close-pixelate.desandro.com).

You may be also be interested in the [Android/Java version of the library](https://github.com/bmaslakov/android-close-pixelate/tree/master/ClosePixelate).

## Examples

|                                                  |                                                  |
|--------------------------------------------------|--------------------------------------------------|
| ![Officer-old](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/officer.jpg?raw=true) | ![Officer-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/officer.png?raw=true) |

```swift
Pixelate.create(pixels: bitmap,
                layers: PixelateLayer(.diamond, resolution: 48, size: 50),
                        PixelateLayer(.diamond, resolution: 48, offset: 24),
                        PixelateLayer(.diamond, resolution: 8, size: 6))
```

|                                                  |                                                  |
|--------------------------------------------------|--------------------------------------------------|
| ![Stanley-old](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/stanley.jpg?raw=true) | ![Stanley-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/stanley.png?raw=true) |

```swift
Pixelate.create(pixels: bitmap,
                layers: PixelateLayer(.square, resolution: 32),
                        PixelateLayer(.circle, resolution: 32, offset: 15),
                        PixelateLayer(.circle, resolution: 32, size: 26, offset: 13),
                        PixelateLayer(.circle, resolution: 32, size: 18, offset: 10),
                        PixelateLayer(.circle, resolution: 32, size: 12, offset: 8))
```

|                                                           |                                                           |
|-----------------------------------------------------------|-----------------------------------------------------------|
| ![Stanley-old](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/take-my-portrait.jpg?raw=true) | ![Stanley-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/take-my-portrait.png?raw=true) |

```swift
Pixelate.create(pixels: bitmap,
                layers: PixelateLayer(.square, resolution: 48),
                        PixelateLayer(.diamond, resolution: 48, offset: 12, alpha: 0.5),
                        PixelateLayer(.diamond, resolution: 48, offset: 36, alpha: 0.5),
                        PixelateLayer(.diamond, resolution: 16, size: 8, offset: 4))
```

|                                            |                                            |
|--------------------------------------------|--------------------------------------------|
| ![Tony-old](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/tony.jpg?raw=true) | ![Tony-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/tony.png?raw=true) |

```swift
Pixelate.create(pixels: bitmap,
                layers: PixelateLayer(.circle, resolution: 32, size: 6, offset: 8),
                        PixelateLayer(.circle, resolution: 32, size: 9, offset: 8),
                        PixelateLayer(.circle, resolution: 32, size: 12, offset: 24),
                        PixelateLayer(.circle, resolution: 32, size: 9, offset: 0))
```

|                                                |                                                |
|------------------------------------------------|------------------------------------------------|
| ![Wonder-old](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/wonder.jpg?raw=true) | ![Wonder-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/wonder.png?raw=true) |

```swift
Pixelate.create(pixels: bitmap,
                layers: PixelateLayer(.diamond, resolution: 24, size: 25),
                        PixelateLayer(.diamond, resolution: 24, offset: 12),
                        PixelateLayer(.square, resolution: 24, alpha: 0.6))
```

|                                              |                                              |
|----------------------------------------------|----------------------------------------------|
| ![Anita-old](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/anita.jpg?raw=true) | ![Anita-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/anita.png?raw=true) |

```swift
Pixelate.create(pixels: bitmap,
                layers: PixelateLayer(.square, resolution: 32),
                        PixelateLayer(.circle, resolution: 32, offset: 16),
                        PixelateLayer(.circle, resolution: 32, offset: 0, alpha: 0.5),
                        PixelateLayer(.circle, resolution: 16, size: 9, offset: 0, alpha: 0.5))
```

|                                                  |                                                  |
|--------------------------------------------------|--------------------------------------------------|
| ![Giraffe-old](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/giraffe.jpg?raw=true) | ![Giraffe-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/giraffe.png?raw=true) |

```swift
Pixelate.create(pixels: bitmap,
                layers: PixelateLayer(.circle, resolution: 24),
                        PixelateLayer(.circle, resolution: 24, size: 9, offset: 12))
```

|                                                |                                                |
|------------------------------------------------|------------------------------------------------|
| ![Kendra-old](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/kendra.jpg?raw=true) | ![Kendra-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/kendra.png?raw=true) |

```swift
Pixelate.create(pixels: bitmap,
                layers: PixelateLayer(.square, resolution: 48, offset: 12),
                        PixelateLayer(.circle, resolution: 48, offset: 0),
                        PixelateLayer(.diamond, resolution: 16, size: 15, offset: 0, alpha: 0.6),
                        PixelateLayer(.diamond, resolution: 16, size: 15, offset: 8, alpha: 0.6))
```

|                                              |                                              |
|----------------------------------------------|----------------------------------------------|
| ![Gavin-old](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/gavin.jpg?raw=true) | ![Gavin-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/gavin.png?raw=true) |

```swift
Pixelate.create(pixels: bitmap,
                layers: PixelateLayer(.square, resolution: 48),
                        PixelateLayer(.diamond, resolution: 12, size: 8),
                        PixelateLayer(.diamond, resolution: 12, size: 8, offset: 6))
```

## Download

The library is available via cocoapods:

```ruby
pod 'ClosePixelate', '1.1.2'
```

## Usage

There are several `Pixelate.create*` methods in the
[`Pixelate`](ClosePixelate/ClosePixelate/Pixelate.swift)
class, allowing to create a pixelated bitmap from `CGImage`:

```swift
let pixelated = Pixelate.create(pixels: bitmap,
                                layers: PixelateLayer(.square, resolution: 48),
                                        PixelateLayer(.diamond, resolution: 48, offset: 12, alpha: 0.5),
                                        PixelateLayer(.diamond, resolution: 48, offset: 36, alpha: 0.5),
                                        PixelateLayer(.diamond, resolution: 16, size: 8, offset: 4))
```

You also can draw directly on a bitmap or on a canvas, using `Pixelate.render*` methods.

There are three basic layer types:

| Original                                 | Square                                                         | Diamond                                                          | Circle                                                         |
|------------------------------------------|----------------------------------------------------------------|------------------------------------------------------------------|----------------------------------------------------------------|
| ![jamie](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/jamie.jpg?raw=true) | ![simple-lo-square](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/simple-lo-square.png?raw=true) | ![simple-lo-diamond](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/simple-lo-diamond.png?raw=true) | ![simple-lo-circle](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/simple-lo-circle.png?raw=true) |

You can change size, resolution, offset and alpha parameters of each layer:

| resolution = 10                                                | resolution = 25                                                | resolution = 20, size = 50, alpha = 0.5          |
|----------------------------------------------------------------|----------------------------------------------------------------|--------------------------------------------------|
| ![simple-lo-square](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/simple-lo-square.png?raw=true) | ![simple-hi-square](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/simple-hi-square.png?raw=true) | ![jamie-new](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/jamie-new.png?raw=true) |

You can also combine several layers into one image:

| square, resolution = 25                                        |       | diamond, resolution = 10                                         |       |                                                                  |
|----------------------------------------------------------------|-------|------------------------------------------------------------------|-------|------------------------------------------------------------------|
| ![simple-hi-square](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/simple-hi-square.png?raw=true) | **+** | ![simple-lo-diamond](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/simple-lo-diamond.png?raw=true) | **=** | ![sample-multilayer](https://raw.githubusercontent.com/bmaslakov/android-close-pixelate/master/screenshots/sample-multilayer.png?raw=true) |
