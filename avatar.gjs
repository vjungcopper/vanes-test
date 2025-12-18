import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';

const imgTypePhoto = "http://localhost:3845/assets/cdeee92051bd9c7d70c6cde842f31c30d05f46f1.png";

/**
 * AvatarImage Component
 * Internal component that renders the avatar image with proper styling
 */
class AvatarImage extends Component {
  <template>
    <div 
      class="avatar-image" 
      data-name="Type=Photo" 
      data-node-id="9667:22057"
      ...attributes
    >
      <img 
        alt={{@alt}} 
        class="avatar-image__img" 
        src={{imgTypePhoto}} 
      />
    </div>
  </template>
}

/**
 * Avatar Component
 * 
 * A flexible avatar component supporting multiple sizes based on design tokens
 * 
 * @arg {boolean} showAvatar - Whether to show the avatar (default: true)
 * @arg {string} size - Size variant: "64" | "56" | "48" | "40" | "32" | "24" | "20" | "16" (default: "16")
 *                      Maps to scale tokens: $scale-16 | $scale-14 | $scale-12 | $scale-10 | $scale-8 | $scale-6 | $scale-5 | $scale-4
 * @arg {string} alt - Alt text for the avatar image (default: "Avatar")
 * 
 * @example
 * <Avatar @size="32" @showAvatar={{true}} />
 * <Avatar @size="48" @alt="User profile picture" />
 */
export default class Avatar extends Component {
  // Design token mapping: size (px) -> scale token
  static SCALE_TOKENS = {
    '16': 'scale-4',
    '20': 'scale-5',
    '24': 'scale-6',
    '32': 'scale-8',
    '40': 'scale-10',
    '48': 'scale-12',
    '56': 'scale-14',
    '64': 'scale-16'
  };

  get size() {
    return this.args.size || '16';
  }

  get showAvatar() {
    return this.args.showAvatar !== false;
  }

  get alt() {
    return this.args.alt || 'Avatar';
  }

  get sizeClass() {
    return `avatar--size-${this.size}`;
  }

  get scaleToken() {
    return Avatar.SCALE_TOKENS[this.size] || 'scale-4';
  }

  get dataNodeId() {
    const sizeNodeMap = {
      '16': '9668:24388',
      '20': '9668:24384',
      '24': '9668:24380',
      '32': '9668:24376',
      '40': '9668:24372',
      '48': '9668:24368',
      '56': '9668:24364',
      '64': '9668:24119'
    };
    return sizeNodeMap[this.size] || sizeNodeMap['16'];
  }

  <template>
    <div 
      class="avatar {{this.sizeClass}}"
      data-name="Size={{this.size}}"
      data-node-id={{this.dataNodeId}}
      data-scale-token={{this.scaleToken}}
      ...attributes
    >
      {{#if this.showAvatar}}
        <AvatarImage @alt={{this.alt}} />
      {{/if}}
    </div>
  </template>
}
