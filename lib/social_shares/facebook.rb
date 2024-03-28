module SocialShares
  class Facebook < Base
    URL = 'http://graph.facebook.com/v2.7/'

    def shares!
      response = get(URL, params: {
        id: checked_url,
        fields: 'share'
      })
      
      JSON.parse(response).fetch('share', {}).fetch('share_count', 0)
    end
  end
end
