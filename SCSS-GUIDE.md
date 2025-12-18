# SCSS Usage Guide - Avatar Component

This guide covers how to use the Avatar component's SCSS architecture effectively.

## Table of Contents

- [Quick Start](#quick-start)
- [SCSS Variables vs CSS Custom Properties](#scss-variables-vs-css-custom-properties)
- [Using Design Tokens](#using-design-tokens)
- [SCSS Maps](#scss-maps)
- [Customization Patterns](#customization-patterns)
- [Best Practices](#best-practices)

## Quick Start

### Basic Import

```scss
// Import the avatar component (includes design tokens automatically)
@use "components/avatar";
```

### Using Design Tokens in Your Components

```scss
// Import tokens with a namespace
@use "design-tokens" as tokens;

.my-component {
  padding: tokens.$scale-4;
  font-size: tokens.$font-size-default;
  color: tokens.$indigo-9;
}
```

## SCSS Variables vs CSS Custom Properties

The design tokens are exported in both formats:

### SCSS Variables (Compile-Time)

Best for static values and calculations:

```scss
@use "design-tokens" as tokens;

.card {
  // Direct use
  padding: tokens.$scale-4;

  // Calculations
  margin: tokens.$scale-8 * 2; // 64px

  // Conditionals
  @if tokens.$scale-4 > 10px {
    border: 1px solid tokens.$indigo-0;
  }
}
```

**Pros:**

- Compile-time calculations
- Type safety
- Better tree-shaking
- No runtime overhead

**Cons:**

- Cannot be changed at runtime
- No theming support

### CSS Custom Properties (Runtime)

Best for dynamic theming and runtime changes:

```scss
.themed-card {
  // Runtime values
  padding: var(--scale-4);
  color: var(--indigo-9);

  // Can be overridden
  &.dark-theme {
    --indigo-9: #ffffff;
  }
}
```

**Pros:**

- Runtime theming
- JavaScript access
- Cascade and inheritance
- Easy dark mode

**Cons:**

- No compile-time calculations
- Slightly larger CSS output

## Using Design Tokens

### Scale Tokens (Sizing & Spacing)

```scss
@use "design-tokens" as tokens;

.element {
  // Sizes
  width: tokens.$scale-8; // 32px
  height: tokens.$scale-12; // 48px

  // Spacing
  padding: tokens.$scale-4; // 16px
  margin: tokens.$scale-6 tokens.$scale-8; // 24px 32px

  // Border radius
  border-radius: tokens.$scale-4; // 16px
}
```

### Color Tokens

```scss
@use "design-tokens" as tokens;

.element {
  background: tokens.$indigo-0; // Light indigo
  color: tokens.$indigo-9; // Dark indigo
  border-color: tokens.$indigo-0;
}
```

### Font Tokens

```scss
@use "design-tokens" as tokens;

.element {
  font-family: tokens.$font-family-default;
  font-size: tokens.$font-size-default;
  font-weight: tokens.$font-weight-semi-bold;
  letter-spacing: tokens.$font-letter-spacing-tight;
}

// Heading styles
.heading {
  font-size: tokens.$font-size-h2;
  font-weight: tokens.$font-weight-semi-bold;
  letter-spacing: tokens.$font-letter-spacing-tight;
}
```

## SCSS Maps

Maps provide programmatic access to token groups:

### Scale Map

```scss
@use "design-tokens" as tokens;

// Available sizes: 4, 5, 6, 8, 10, 12, 14, 16
@each $key, $value in tokens.$scale-map {
  .p-#{$key} {
    padding: $value;
  }

  .m-#{$key} {
    margin: $value;
  }
}

// Generates:
// .p-4 { padding: 16px; }
// .m-4 { margin: 16px; }
// .p-5 { padding: 20px; }
// etc.
```

### Font Size Map

```scss
@use "design-tokens" as tokens;

@each $name, $size in tokens.$font-size-map {
  .text-#{$name} {
    font-size: $size;
  }
}

// Generates:
// .text-smallest { font-size: 12px; }
// .text-small { font-size: 14px; }
// .text-default { font-size: 16px; }
// etc.
```

### Color Map

```scss
@use "design-tokens" as tokens;

@each $shade, $color in tokens.$indigo-map {
  .bg-indigo-#{$shade} {
    background-color: $color;
  }

  .text-indigo-#{$shade} {
    color: $color;
  }
}

// Generates:
// .bg-indigo-0 { background-color: #dee3ff; }
// .text-indigo-9 { color: #0c1647; }
```

## Customization Patterns

### Override Avatar Sizes

```scss
// my-custom-avatar.scss
@use "design-tokens" as tokens;

.avatar {
  // Add custom sizes
  &--size-72 {
    width: 72px;
    height: 72px;
  }

  &--size-80 {
    width: tokens.$scale-16 + 16px; // 80px
    height: tokens.$scale-16 + 16px;
  }
}
```

### Themed Avatars

```scss
@use "design-tokens" as tokens;

.avatar {
  // Add border styles
  &--bordered {
    border: 2px solid tokens.$indigo-0;
  }

  // Add shadow
  &--elevated {
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  // Square variant
  &--square {
    .avatar-image {
      border-radius: tokens.$scale-4; // Rounded corners
    }
  }

  // Circular with border
  &--ring {
    padding: 2px;
    background: linear-gradient(
      135deg,
      tokens.$indigo-0 0%,
      tokens.$indigo-9 100%
    );
    border-radius: 100px;
  }
}
```

### Responsive Sizes

```scss
@use "design-tokens" as tokens;

.avatar {
  // Mobile: small
  width: tokens.$scale-8;
  height: tokens.$scale-8;

  // Tablet: medium
  @media (min-width: 768px) {
    width: tokens.$scale-12;
    height: tokens.$scale-12;
  }

  // Desktop: large
  @media (min-width: 1024px) {
    width: tokens.$scale-16;
    height: tokens.$scale-16;
  }
}
```

### Create Utility Classes

```scss
@use "design-tokens" as tokens;

// Spacing utilities
@each $key, $value in tokens.$scale-map {
  .p-#{$key} {
    padding: $value;
  }
  .pt-#{$key} {
    padding-top: $value;
  }
  .pr-#{$key} {
    padding-right: $value;
  }
  .pb-#{$key} {
    padding-bottom: $value;
  }
  .pl-#{$key} {
    padding-left: $value;
  }

  .m-#{$key} {
    margin: $value;
  }
  .mt-#{$key} {
    margin-top: $value;
  }
  .mr-#{$key} {
    margin-right: $value;
  }
  .mb-#{$key} {
    margin-bottom: $value;
  }
  .ml-#{$key} {
    margin-left: $value;
  }
}

// Size utilities
@each $key, $value in tokens.$scale-map {
  .w-#{$key} {
    width: $value;
  }
  .h-#{$key} {
    height: $value;
  }
  .size-#{$key} {
    width: $value;
    height: $value;
  }
}
```

## Best Practices

### 1. Always Use Namespaced Imports

```scss
// Good
@use "design-tokens" as tokens;
.element {
  padding: tokens.$scale-4;
}

// Avoid (pollutes namespace)
@use "design-tokens" as *;
.element {
  padding: $scale-4;
}
```

### 2. Use SCSS Variables for Calculations

```scss
@use "design-tokens" as tokens;

// Good - compile-time calculation
.card {
  padding: tokens.$scale-4;
  margin: tokens.$scale-4 * 2;
}

// Avoid - CSS calc with custom properties
.card {
  padding: var(--scale-4);
  margin: calc(var(--scale-4) * 2);
}
```

### 3. Use CSS Custom Properties for Theming

```scss
@use "design-tokens" as tokens;

.card {
  // Static properties
  padding: tokens.$scale-4;
  border-radius: tokens.$scale-4;

  // Themeable properties
  background: var(--card-bg, #{tokens.$indigo-0});
  color: var(--card-text, #{tokens.$indigo-9});
}

// Theme override
.dark-theme .card {
  --card-bg: #{tokens.$indigo-9};
  --card-text: #{tokens.$indigo-0};
}
```

### 4. Organize Your SCSS Files

```
styles/
├── design-tokens.scss       # Design system tokens
├── components/
│   ├── avatar.scss          # Avatar component
│   ├── button.scss          # Other components
│   └── card.scss
├── utilities/
│   ├── spacing.scss         # Utility classes
│   └── typography.scss
└── app.scss                 # Main entry point
```

### 5. Forward Tokens for Sub-modules

If you need to expose tokens to other files:

```scss
// _tokens.scss (internal file)
@forward "design-tokens";

// button.scss
@use "tokens";

.button {
  padding: tokens.$scale-4;
}
```

## Common Patterns

### Avatar Group

```scss
@use "design-tokens" as tokens;

.avatar-group {
  display: flex;

  .avatar {
    margin-left: -(tokens.$scale-4);
    border: 2px solid white;

    &:first-child {
      margin-left: 0;
    }
  }
}
```

### Avatar with Status Badge

```scss
@use "design-tokens" as tokens;

.avatar {
  position: relative;

  &__badge {
    position: absolute;
    bottom: 0;
    right: 0;
    width: tokens.$scale-4;
    height: tokens.$scale-4;
    border: 2px solid white;
    border-radius: 50%;

    &--online {
      background: #10b981;
    }
    &--offline {
      background: #6b7280;
    }
    &--busy {
      background: #ef4444;
    }
  }
}
```

## Migration from CSS

If you're migrating from CSS to SCSS:

1. Rename `.css` files to `.scss`
2. Replace `@import` with `@use` (with namespace)
3. Convert CSS custom properties to SCSS variables where appropriate
4. Add nesting for related selectors
5. Create maps for repeated patterns
6. Extract shared values to variables

## Resources

- [SCSS Documentation](https://sass-lang.com/documentation)
- [SCSS @use and @forward](https://sass-lang.com/documentation/at-rules/use)
- [BEM Naming Convention](http://getbem.com/)
- [Alloy Design System](https://www.figma.com/design/uk6wKEFHS1XCP01RzRZ17Y/)
