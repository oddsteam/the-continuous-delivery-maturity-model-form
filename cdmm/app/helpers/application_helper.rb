module ApplicationHelper
    def custom_title(title)
        "#{title} #{default_meta_tags[:separator]} #{default_meta_tags[:site]}"
    end

    def default_meta_tags
        {
            site: 'CDMM',
            title: 'Continuous Delivery Maturity Model',
            reverse: true,
            separator: '|',
            description: 'Continuous Delivery Maturity Assessment Form',
            keywords: 'action, horror, drama',
            canonical: request.original_url,
            noindex: !Rails.env.production?,
            icon: [
                # { href: image_url('box.svg'), type: 'image/svg+xml' },
                # { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
            ],
            og: {
                site_name: 'CDMM',
                title: 'Continuous Delivery Maturity Model',
                description: 'The Continuous Delivery Maturity Assessment Form', 
                type: 'website',
                url: request.original_url,
            }
        }
    end
end
