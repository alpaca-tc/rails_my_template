if install?('paperclip')
  install_gem 'paperclip'

  create_file 'config/initializers/paperclip.rb', <<-DATA
  Paperclip::Attachment.default_options.update({
    url: '/paperclip/:class/:id/:attachment/:style_:hash.:extension',
    path: ':rails_root/public:url',
    hash_secret: '#{@config.hash_key(37)}',
    styles: {
      big: '700x700>',
      thumb: 'x100',

      icon: '57x57',
      icon2x: '114x114',
      icon_small: '29x29',
      icon_small2x: '58x58',
      icon72: '72x72',

      itunes_artwork: '512x512',
      default: '320x480',
      default2x: '640x960',

      company_logo: '112x68',

      default_portrait: '768x1004', # ipad
      default_landscape: '1024x748',
    },
    default_style: :big,
    default_url: '/paperclip/common/no_image.jpg'
  })
  DATA
end
