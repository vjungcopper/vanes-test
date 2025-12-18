# CSS vs SCSS Comparison - Avatar Component

This document compares the CSS and SCSS implementations to help you choose the right approach for your project.

## Quick Comparison

| Feature             | CSS                        | SCSS                                   |
| ------------------- | -------------------------- | -------------------------------------- |
| **File Extension**  | `.css`                     | `.scss`                                |
| **Variables**       | CSS Custom Properties only | SCSS variables + CSS Custom Properties |
| **Nesting**         | ❌ No                      | ✅ Yes                                 |
| **Calculations**    | Runtime with `calc()`      | Compile-time                           |
| **Maps/Loops**      | ❌ No                      | ✅ Yes                                 |
| **Build Step**      | ❌ Not required            | ✅ Required (SCSS compiler)            |
| **Browser Support** | Direct                     | Compiles to CSS                        |
| **File Size**       | Same output                | Same output                            |

## Code Comparison

### Design Tokens

#### CSS Version (`design-tokens.css`)

```css
:root {
  --scale-4: 16px;
  --scale-5: 20px;
  --scale-6: 24px;
  --scale-8: 32px;
  /* ... more tokens ... */
}
```

**Pros:**

- No build step required
- Works directly in browser
- Simple to understand

**Cons:**

- No compile-time calculations
- No maps or loops
- Repetitive code

#### SCSS Version (`design-tokens.scss`)

```scss
// SCSS Variables (compile-time)
$scale-4: 16px;
$scale-5: 20px;
$scale-6: 24px;
$scale-8: 32px;

// Map for programmatic access
$scale-map: (
  4: $scale-4,
  5: $scale-5,
  6: $scale-6,
  8: $scale-8,
  // ...
);

// Export as CSS Custom Properties
:root {
  --scale-4: #{$scale-4};
  --scale-5: #{$scale-5};
  // ...
}
```

**Pros:**

- Best of both worlds (SCSS + CSS vars)
- Compile-time calculations
- Maps for programmatic access
- Type safety

**Cons:**

- Requires SCSS compiler
- Slightly more complex

### Avatar Styles

#### CSS Version (`avatar.css`)

```css
.avatar {
  position: relative;
  display: inline-block;
}

.avatar--size-16 {
  width: var(--scale-4);
  height: var(--scale-4);
}

.avatar--size-20 {
  width: var(--scale-5);
  height: var(--scale-5);
}

.avatar--size-24 {
  width: var(--scale-6);
  height: var(--scale-6);
}

/* ... 5 more size variants ... */

.avatar-image {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: hidden;
  border-radius: 100px;
}

.avatar-image__img {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  max-width: none;
  object-fit: cover;
  object-position: 50% 50%;
  pointer-events: none;
}
```

**Lines of Code:** ~74 lines

**Pros:**

- No build step
- Easy to understand
- Works everywhere

**Cons:**

- Repetitive size variants
- No nesting
- Harder to maintain
- Can't use calculations

#### SCSS Version (`avatar.scss`)

```scss
@use "design-tokens" as tokens;

// Configuration map
$avatar-sizes: (
  16: tokens.$scale-4,
  20: tokens.$scale-5,
  24: tokens.$scale-6,
  32: tokens.$scale-8,
  40: tokens.$scale-10,
  48: tokens.$scale-12,
  56: tokens.$scale-14,
  64: tokens.$scale-16,
);

// Base styles with nested modifiers
.avatar {
  position: relative;
  display: inline-block;

  // Generate size variants programmatically
  @each $size, $value in $avatar-sizes {
    &--size-#{$size} {
      width: $value;
      height: $value;
    }
  }
}

// Nested BEM structure
.avatar-image {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: hidden;
  border-radius: 100px;

  &__img {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100%;
    max-width: none;
    object-fit: cover;
    object-position: 50% 50%;
    pointer-events: none;
  }
}
```

**Lines of Code:** ~56 lines (24% less code)

**Pros:**

- DRY (Don't Repeat Yourself)
- Programmatic generation
- Easy to add new sizes
- Nesting shows hierarchy
- Compile-time safety

**Cons:**

- Requires build step
- Need to learn SCSS syntax

## Use Cases

### Use CSS When:

✅ **No Build System**

- Static HTML projects
- Simple websites
- Quick prototypes
- Learning projects

✅ **Maximum Browser Compatibility**

- Legacy browser support
- No tooling constraints
- Direct file serving

✅ **Simplicity is Key**

- Small projects
- Single component
- Minimal maintenance

### Use SCSS When:

✅ **Modern Build Pipeline**

- Using Webpack, Vite, Parcel, etc.
- Ember CLI (built-in SCSS support)
- Create React App with SCSS
- Next.js, Nuxt.js projects

✅ **Design System**

- Multiple components
- Shared tokens
- Utility generation
- Consistent patterns

✅ **Team Development**

- Code organization
- Better maintainability
- Type safety
- IDE support

## Feature Examples

### 1. Adding a New Size

#### CSS Approach

```css
/* Manually add to design-tokens.css */
:root {
  --scale-18: 72px;
}

/* Manually add to avatar.css */
.avatar--size-72 {
  width: var(--scale-18);
  height: var(--scale-18);
}
```

Changes: 2 files, 5 lines

#### SCSS Approach

```scss
// Only update design-tokens.scss
$scale-18: 72px;

$scale-map: (
  // ... existing sizes ...
  18: $scale-18
);

// Update avatar.scss
$avatar-sizes: (
  // ... existing sizes ...
  72: tokens.$scale-18
);
```

Changes: 2 files, 2 lines (automatically generates the class)

### 2. Customization

#### CSS Approach

```css
/* Create new file: custom-avatar.css */
.avatar--bordered {
  border: 2px solid var(--indigo-0);
}

.avatar--square .avatar-image {
  border-radius: 8px;
}
```

#### SCSS Approach

```scss
// Extend in same file or new partial
@use "design-tokens" as tokens;

.avatar {
  &--bordered {
    border: 2px solid tokens.$indigo-0;
  }

  &--square {
    .avatar-image {
      border-radius: tokens.$scale-4;
    }
  }
}
```

SCSS provides better organization with nesting.

### 3. Generating Utilities

#### CSS Approach

```css
/* Must manually write each utility */
.p-4 {
  padding: var(--scale-4);
}
.p-5 {
  padding: var(--scale-5);
}
.p-6 {
  padding: var(--scale-6);
}
/* ... etc */

.m-4 {
  margin: var(--scale-4);
}
.m-5 {
  margin: var(--scale-5);
}
/* ... etc */
```

#### SCSS Approach

```scss
@use "design-tokens" as tokens;

// Generate all utilities automatically
@each $key, $value in tokens.$scale-map {
  .p-#{$key} {
    padding: $value;
  }
  .m-#{$key} {
    margin: $value;
  }
}
```

Much more maintainable!

## Performance

### Build Time

- **CSS**: No build time (direct use)
- **SCSS**: ~50-200ms compilation (cached in development)

### Runtime Performance

- **Identical**: Both compile to the same CSS
- **File Size**: Same final output
- **Browser Parsing**: No difference

### Development Experience

- **CSS**: Faster initial setup
- **SCSS**: Faster long-term development

## Migration Path

### From CSS to SCSS

1. Rename files: `.css` → `.scss`
2. Install SCSS compiler
3. Keep existing code (valid SCSS)
4. Gradually add SCSS features
5. Refactor as needed

### From SCSS to CSS

1. Compile SCSS to CSS
2. Save output as `.css`
3. Replace variable usage with CSS custom properties
4. Remove build step

## Recommendation

### Choose SCSS if:

- ✅ You have Ember CLI or modern build tools
- ✅ Building a component library or design system
- ✅ Working with a team
- ✅ Planning to scale
- ✅ Want better IDE support

### Choose CSS if:

- ✅ No build system available
- ✅ Simple, one-off project
- ✅ Learning web development
- ✅ Maximum simplicity needed
- ✅ Legacy browser constraints

## Both Are Included!

This project provides **both CSS and SCSS versions** so you can choose what works best for your setup:

```
avatar.css         ← Use for CSS projects
avatar.scss        ← Use for SCSS projects

design-tokens.css  ← Use for CSS projects
design-tokens.scss ← Use for SCSS projects
```

Both generate identical visual output!

## Conclusion

**For the Avatar component specifically:**

- **Small projects**: Use CSS (simpler)
- **Ember apps**: Use SCSS (built-in support)
- **Design systems**: Use SCSS (better organization)
- **Learning**: Start with CSS, migrate to SCSS

Both versions are fully supported and maintained! 🎉
