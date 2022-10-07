class GistQuestionService
  Response = Struct.new(:client_response) do
    def html_url
      client_response.html_url
    end

    def success?
      html_url.present?
    end
  end

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    Response.new(@client.create_gist(gist_params))
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def gist_params
    {
      description: I18n.t('gist_description', test_title: @test.title),
      files: {
        'test_guru_question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
