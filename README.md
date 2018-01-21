# The Movie Database API

RxSwift programming against 'The Movie Database API'

[The Movie Database API](https://developers.themoviedb.org/3/getting-started "The Movie Database API")

## Config

1. File **TMDbCore/Config/Keys.xcconfig.example** is an example with the API key/value

2. Copy or rename this file as **TMDbCore/Config/Keys.xcconfig**

3. Customize the file with your own TMDB_API_KEY

4. Import **TMDbCore/Config/Keys.xcconfig** to your **TMDbCore/Config** folder

5. Install Carthage or update it, or probably you'll see 'No such module RxSwift' error. Make sure that RxSwift is configured correctly

```
$ cd <your_TMDB_dir>
$ carthage build --platform iOS
$ carthage update
```

**Build process can take several minutes**

## Start the project

You should open TMDb.xcworkspace to start the aplication.

```
$ cd <your_TMDB_dir>
$ open TMDb.xcworkspace
```

## Build and run

Build TMDbCore and TMDb to test Playgrounds and run the aplication.

## Git Branch

Valid branch is master branch

## DEMO

[![TMDB DEMO](https://drive.google.com/file/d/1AWWqIYYGJ7dhxNaJIkxL8CfpUdpT3czL)](https://drive.google.com/file/d/1AWWqIYYGJ7dhxNaJIkxL8CfpUdpT3czL "TMDB DEMO")
