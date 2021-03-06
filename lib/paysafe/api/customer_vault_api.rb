module Paysafe
  module Api
    class CustomerVaultApi < BaseApi

      def create_address(profile_id:, country:, zip:, **args)
        data = args.merge({ country: country, zip: zip })
        perform_post_with_object("/customervault/v1/profiles/#{profile_id}/addresses", data, Address)
      end

      def create_card(profile_id:, **data)
        perform_post_with_object("/customervault/v1/profiles/#{profile_id}/cards", data, Card)
      end

      def create_profile(merchant_customer_id:, locale:, **args)
        data = args.merge({
          merchant_customer_id: merchant_customer_id,
          locale: locale
        })

        perform_post_with_object("/customervault/v1/profiles", data, Profile)
      end

      def create_single_use_token(**data)
        perform_post_with_object("/customervault/v1/singleusetokens", data, SingleUseToken)
      end

      def delete_address(profile_id:, id:)
        perform_delete("/customervault/v1/profiles/#{profile_id}/addresses/#{id}")
      end

      def delete_card(profile_id:, id:)
        perform_delete("/customervault/v1/profiles/#{profile_id}/cards/#{id}")
      end

      def delete_profile(id:)
        perform_delete("/customervault/v1/profiles/#{id}")
      end

      def get_address(profile_id:, id:)
        perform_get_with_object("/customervault/v1/profiles/#{profile_id}/addresses/#{id}", Address)
      end

      def get_card(profile_id:, id:)
        perform_get_with_object("/customervault/v1/profiles/#{profile_id}/cards/#{id}", Card)
      end

      def get_profile(id:, fields: [])
        path = "/customervault/v1/profiles/#{id}"
        path += "?fields=#{fields.join(',')}" if !fields.empty?

        perform_get_with_object(path, Profile)
      end

      def update_address(profile_id:, id:, country:, zip:, **args)
        data = args.merge({ country: country, zip: zip })
        perform_put_with_object("/customervault/v1/profiles/#{profile_id}/addresses/#{id}", data, Address)
      end

      def update_card(profile_id:, id:, **data)
        perform_put_with_object("/customervault/v1/profiles/#{profile_id}/cards/#{id}", data, Card)
      end

      def update_profile(id:, merchant_customer_id:, locale:, **args)
        data = args.merge({
          merchant_customer_id: merchant_customer_id,
          locale: locale
        })

        perform_put_with_object("/customervault/v1/profiles/#{id}", data, Profile)
      end

    end
  end
end
