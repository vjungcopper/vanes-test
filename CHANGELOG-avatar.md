# Avatar Component Changelog

## Version 1.2.0 - SCSS Migration

### Updated: December 17, 2025

### 🎯 Changes

Migrated all CSS files to SCSS format with modern SCSS features including variables, nesting, maps, and the `@use` module system.

### ✨ New Features

1. **SCSS Variables**

   - All design tokens available as SCSS variables (compile-time)
   - Maintained CSS custom properties for runtime theming
   - Added SCSS maps for programmatic access

2. **Modern Module System**

   - Using `@use` instead of deprecated `@import`
   - Namespaced imports prevent variable collisions
   - Cleaner dependency management

3. **Enhanced Organization**

   - SCSS maps for scale tokens, colors, and font sizes
   - BEM naming with SCSS nesting
   - Programmatic size generation using `@each`

4. **New Documentation**
   - Comprehensive SCSS usage guide (`SCSS-GUIDE.md`)
   - Examples for customization patterns
   - Best practices and common patterns

### 🔄 Updated Files

1. **design-tokens.css → design-tokens.scss**

   - Added SCSS variables alongside CSS custom properties
   - Created maps: `$scale-map`, `$indigo-map`, `$font-size-map`
   - Improved font-family with fallback stack

2. **avatar.css → avatar.scss**

   - Uses `@use` to import design tokens
   - Created `$avatar-sizes` map for configuration
   - Implemented BEM nesting for cleaner code
   - Programmatic size generation using `@each`

3. **README-avatar.md**

   - Updated installation instructions for SCSS
   - Added SCSS architecture section
   - Enhanced customization examples with SCSS features

4. **New: SCSS-GUIDE.md**
   - Complete guide to using SCSS features
   - Token usage examples
   - Customization patterns
   - Migration guide from CSS

### 📊 SCSS Features Used

- **Variables**: `$scale-4`, `$indigo-9`, etc.
- **Maps**: `$scale-map`, `$avatar-sizes`
- **Nesting**: BEM-style component nesting
- **@use**: Modern module imports
- **@each**: Programmatic class generation
- **Interpolation**: `#{$variable}` for CSS custom properties

### 💡 Benefits

- **Type Safety**: SCSS variables provide compile-time checking
- **Better IDE Support**: Autocomplete for variables and maps
- **Calculations**: Compile-time math operations
- **Code Reusability**: Maps and loops reduce duplication
- **Maintainability**: Easier to update and extend

### 🔍 Migration Notes

**For New Projects:**

- Use the `.scss` files directly
- Import with `@use "components/avatar"`

**For Existing Projects:**

- `.css` files are still available (not deleted)
- Gradually migrate to `.scss` versions
- Update build pipeline to process SCSS

**No Breaking Changes:**

- Component API remains identical
- Generated CSS output is the same
- Can use CSS custom properties for theming

---

## Version 1.1.0 - Design Token Integration

### Updated: December 17, 2025

### 🎯 Changes

Updated the Avatar component to use Figma design tokens for sizing, ensuring consistency with the Alloy Design System V2.1.

### ✨ New Features

1. **Design Token Integration**

   - Added mapping from pixel sizes to Figma scale tokens ($scale-4 through $scale-16)
   - Component now includes `data-scale-token` attribute for debugging
   - Created centralized `design-tokens.css` file for reusable design tokens

2. **New Files**
   - `design-tokens.css` - Complete Alloy Design System V2.1 design tokens including:
     - Scale tokens (sizing/spacing)
     - Color tokens (Indigo palette)
     - Font tokens (family, size, weight, letter spacing)

### 🔄 Updated Files

1. **avatar.gjs**

   - Added `SCALE_TOKENS` static property mapping sizes to token names
   - Added `scaleToken` getter to compute the current token
   - Updated template to include `data-scale-token` attribute
   - Enhanced JSDoc comments to document token mapping

2. **avatar.css**

   - Replaced hardcoded pixel values with CSS custom properties
   - Now references `design-tokens.css` for token definitions
   - Uses `var(--scale-X)` pattern for all size variants

3. **avatar-demo.hbs**

   - Added new "Design Tokens" section with comprehensive table
   - Table shows size, Figma token, CSS variable, and live preview
   - Enhanced styling for better token visualization

4. **README-avatar.md**
   - Added design token feature to features list
   - Updated installation instructions to include `design-tokens.css`
   - Added new "Design Tokens" section with complete mapping table
   - Updated API documentation to show Figma token mappings

### 📊 Token Mappings

| Size | Figma Token | CSS Variable | Component Size |
| ---- | ----------- | ------------ | -------------- |
| 16px | $scale-4    | --scale-4    | @size="16"     |
| 20px | $scale-5    | --scale-5    | @size="20"     |
| 24px | $scale-6    | --scale-6    | @size="24"     |
| 32px | $scale-8    | --scale-8    | @size="32"     |
| 40px | $scale-10   | --scale-10   | @size="40"     |
| 48px | $scale-12   | --scale-12   | @size="48"     |
| 56px | $scale-14   | --scale-14   | @size="56"     |
| 64px | $scale-16   | --scale-16   | @size="64"     |

### 💡 Benefits

- **Design System Consistency**: All sizes now map directly to Figma tokens
- **Easy Maintenance**: Update token values in one place (`design-tokens.css`)
- **Debugging**: `data-scale-token` attribute makes it easy to verify token usage
- **Scalability**: Other components can reuse the same design tokens
- **Documentation**: Clear mapping between code, CSS, and Figma

### 🔍 Migration Notes

If you're upgrading from version 1.0.0:

1. Import `design-tokens.css` before `avatar.css` in your main stylesheet
2. No component API changes - existing usage remains the same
3. The rendered output is visually identical
4. Optionally update your stylesheets to use the new design tokens

### 📦 Files in This Release

- `avatar.gjs` - Main component (updated)
- `avatar.css` - Component styles (updated)
- `avatar-demo.hbs` - Demo template (updated)
- `README-avatar.md` - Documentation (updated)
- `design-tokens.css` - Design tokens (new)
- `CHANGELOG-avatar.md` - This file (new)

---

## Version 1.0.0 - Initial Release

### Released: December 17, 2025

Initial implementation of the Avatar component from Alloy Design System V2.1.

### Features

- 8 size variants (16px to 64px)
- Circular avatar with proper image scaling
- Accessible with customizable alt text
- Toggle visibility with `showAvatar` property
- Self-contained with internal AvatarImage component
- Preserves Figma node IDs for design-to-code traceability
