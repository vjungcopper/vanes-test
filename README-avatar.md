# Avatar Component

An Ember.js Avatar component from the Alloy Design System V2.1, supporting multiple sizes and display states.

> **📦 Available in both CSS and SCSS!** Choose the format that works best for your project.
>
> - 📄 Use `.css` files for simple projects without build tools
> - 🎨 Use `.scss` files for modern projects with SCSS support (recommended for Ember)

## Design Source

- **Figma Design System**: Alloy Design System V2.1
- **Figma Node ID**: 9668-24363
- **Design URL**: [View in Figma](https://www.figma.com/design/uk6wKEFHS1XCP01RzRZ17Y/Alloy-Design-System-V2.1?node-id=9668-24363&m=dev)

## Component Overview

The Avatar component is a flexible, reusable component that displays user profile pictures or placeholder images in various sizes. It follows modern Ember (Octane+) conventions using Glimmer components with the `.gjs` template tag format.

## Features

- ✨ 8 size variants (16px, 20px, 24px, 32px, 40px, 48px, 56px, 64px)
- 🎨 Circular avatar with proper image scaling
- ♿ Accessible with customizable alt text
- 🔄 Toggle visibility with `showAvatar` property
- 📦 Self-contained with internal AvatarImage component
- 🏷️ Preserves Figma node IDs for design-to-code traceability
- 🎯 Uses Figma design tokens ($scale-4 through $scale-16) for sizing consistency

## Installation

### Option A: SCSS (Recommended for Ember)

1. Copy `design-tokens.scss` to your styles directory:

   ```
   app/styles/design-tokens.scss
   ```

2. Copy `avatar.gjs` to your Ember app's components directory:

   ```
   app/components/avatar.gjs
   ```

3. Copy `avatar.scss` to your styles directory:

   ```
   app/styles/components/avatar.scss
   ```

4. Import the component SCSS in your main stylesheet:

   ```scss
   @use "components/avatar";
   ```

   Note: `avatar.scss` already imports `design-tokens.scss` using `@use`, so you don't need to import tokens separately.

### Option B: Plain CSS (No build tools required)

1. Copy `design-tokens.css` to your styles directory:

   ```
   app/styles/design-tokens.css
   ```

2. Copy `avatar.gjs` to your Ember app's components directory:

   ```
   app/components/avatar.gjs
   ```

3. Copy `avatar.css` to your styles directory:

   ```
   app/styles/components/avatar.css
   ```

4. Import the design tokens and component CSS in your main stylesheet:

   ```css
   @import "design-tokens.css";
   @import "components/avatar.css";
   ```

### Which Should I Choose?

- ✅ **Use SCSS** if you have Ember CLI or a build system (better organization, less code)
- ✅ **Use CSS** if you want simplicity or don't have SCSS compilation

See [CSS-VS-SCSS.md](./CSS-VS-SCSS.md) for a detailed comparison.

## Usage

### Basic Usage

```handlebars
<Avatar />
```

This renders a 16px avatar (default size).

### Size Variants

```handlebars
<Avatar @size="16" />
<Avatar @size="20" />
<Avatar @size="24" />
<Avatar @size="32" />
<Avatar @size="40" />
<Avatar @size="48" />
<Avatar @size="56" />
<Avatar @size="64" />
```

### Custom Alt Text

```handlebars
<Avatar @size="48" @alt="John Doe profile picture" />
```

### Toggle Visibility

```handlebars
<Avatar @size="32" @showAvatar={{true}} />
<Avatar @size="32" @showAvatar={{false}} />
```

### With Dynamic Values

```handlebars
<Avatar
  @size={{this.selectedSize}}
  @showAvatar={{this.isVisible}}
  @alt={{this.user.name}}
/>
```

## API

### Arguments

| Argument      | Type      | Default    | Description                                                                                                                                                               |
| ------------- | --------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `@size`       | `string`  | `"16"`     | Size variant: "16", "20", "24", "32", "40", "48", "56", "64"<br/>Maps to Figma tokens: $scale-4, $scale-5, $scale-6, $scale-8, $scale-10, $scale-12, $scale-14, $scale-16 |
| `@showAvatar` | `boolean` | `true`     | Whether to display the avatar image                                                                                                                                       |
| `@alt`        | `string`  | `"Avatar"` | Alt text for accessibility                                                                                                                                                |

### CSS Classes

The component generates the following classes:

- `.avatar` - Base avatar container
- `.avatar--size-{size}` - Size-specific modifier (e.g., `.avatar--size-32`)
- `.avatar-image` - Image wrapper
- `.avatar-image__img` - The actual image element

### Design Tokens

The component uses the following Figma design tokens:

| Token       | Value | CSS Variable | Used For    |
| ----------- | ----- | ------------ | ----------- |
| `$scale-4`  | 16px  | `--scale-4`  | 16px avatar |
| `$scale-5`  | 20px  | `--scale-5`  | 20px avatar |
| `$scale-6`  | 24px  | `--scale-6`  | 24px avatar |
| `$scale-8`  | 32px  | `--scale-8`  | 32px avatar |
| `$scale-10` | 40px  | `--scale-10` | 40px avatar |
| `$scale-12` | 48px  | `--scale-12` | 48px avatar |
| `$scale-14` | 56px  | `--scale-14` | 56px avatar |
| `$scale-16` | 64px  | `--scale-16` | 64px avatar |

The component adds a `data-scale-token` attribute to make the token mapping visible in the DOM for debugging purposes.

## SCSS Architecture

The Avatar component uses modern SCSS features for better maintainability:

### SCSS Variables

The design tokens are available as both SCSS variables (compile-time) and CSS custom properties (runtime):

```scss
@use "design-tokens" as tokens;

// Use SCSS variables
.my-component {
  width: tokens.$scale-8; // 32px
  padding: tokens.$scale-4; // 16px
  color: tokens.$indigo-9; // #0c1647
  font-family: tokens.$font-family-default;
}

// Or use CSS custom properties for dynamic theming
.my-themed-component {
  width: var(--scale-8);
  color: var(--indigo-9);
}
```

### SCSS Maps

Token values are organized in maps for programmatic access:

```scss
@use "design-tokens" as tokens;

// Available maps:
// - tokens.$scale-map
// - tokens.$indigo-map
// - tokens.$font-size-map

// Example: Generate utilities
@each $key, $value in tokens.$scale-map {
  .m-#{$key} {
    margin: $value;
  }
}
```

### BEM Naming with Nesting

The component uses BEM (Block Element Modifier) naming with SCSS nesting:

```scss
.avatar {
  // Block
  &--size-16 {
  } // Modifier
  &--size-24 {
  } // Modifier
}

.avatar-image {
  // Block
  &__img {
  } // Element
}
```

## Customization

### Using Custom Images

To use custom images, modify the `imgTypePhoto` constant in `avatar.gjs`:

```javascript
const imgTypePhoto = "path/to/your/image.png"
```

Or make it dynamic by accepting an `@src` argument:

```javascript
export default class Avatar extends Component {
  get imageSrc() {
    return this.args.src || "default-avatar.png";
  }

  <template>
    <div class="avatar {{this.sizeClass}}" ...attributes>
      {{#if this.showAvatar}}
        <AvatarImage @src={{this.imageSrc}} @alt={{this.alt}} />
      {{/if}}
    </div>
  </template>
}
```

### Styling Customization

Override SCSS variables or classes to match your design system:

```scss
@use "design-tokens" as tokens;

.avatar {
  // Add border using design tokens
  border: 2px solid tokens.$indigo-0;

  // Or use custom values
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.avatar-image {
  // Change border radius for square avatars
  border-radius: 8px; // Square with rounded corners instead of circle
}
```

You can also override the size map:

```scss
@use "design-tokens" as tokens;

// Custom sizes with design tokens
$custom-avatar-sizes: (
  16: tokens.$scale-4,
  24: tokens.$scale-6,
  32: tokens.$scale-8,
  48: tokens.$scale-12,
  64: tokens.$scale-16,
);
```

## Demo

A demo template is provided in `avatar-demo.hbs` that showcases:

- All 8 size variants
- Visibility toggle examples
- Usage code snippets

To use the demo, create a route and render the demo template.

## Browser Support

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Requires Ember 3.28+ for Glimmer component support

## Accessibility

- Uses semantic HTML
- Includes `alt` attribute for screen readers
- Keyboard navigable when used in interactive contexts

## Notes

- The component preserves Figma `data-node-id` attributes for design-to-code traceability
- Image uses `object-fit: cover` to maintain aspect ratio
- Circular avatars use `border-radius: 100px` for perfect circles at any size

## Future Enhancements

Potential improvements:

- Support for different avatar types (photo, illustration variants)
- Status indicator badges
- Initials fallback when no image is available
- Image loading states
- Multiple border styles

## Documentation

This component comes with comprehensive documentation:

- **[README-avatar.md](./README-avatar.md)** (this file) - Complete component documentation
- **[SCSS-GUIDE.md](./SCSS-GUIDE.md)** - Comprehensive SCSS usage guide with examples
- **[CSS-VS-SCSS.md](./CSS-VS-SCSS.md)** - Comparison to help you choose between CSS and SCSS
- **[CHANGELOG-avatar.md](./CHANGELOG-avatar.md)** - Version history and changes

## Files Included

### Component Files

- `avatar.gjs` - Main Ember component (102 lines)
- `avatar.scss` - SCSS styles (56 lines) ⭐ Recommended
- `avatar.css` - Plain CSS styles (74 lines)
- `avatar-demo.hbs` - Demo template with examples

### Design Token Files

- `design-tokens.scss` - Design system tokens in SCSS ⭐ Recommended
- `design-tokens.css` - Design system tokens in plain CSS

### Documentation Files

- `README-avatar.md` - This documentation
- `SCSS-GUIDE.md` - SCSS usage guide
- `CSS-VS-SCSS.md` - CSS vs SCSS comparison
- `CHANGELOG-avatar.md` - Version history

## License

Part of the Alloy Design System V2.1
