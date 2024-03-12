# Flutter Internals

## Three Trees

Flutter has three trees that are used to render the UI. These are:

- **Widget Tree**: Combination of widgets in the application.
  - Defines user interface and widgets relationship.
- **Element Tree**: *In-memory* representation of your widgets
  - Created behind the scenes
  - Used for determining necessary UI updates, elements are re-used if possible
- **Render Tree**: *On-screen* representation of your widgets