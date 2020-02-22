class MovieExportMailer < ApplicationMailer
  def send_file(user_id, file_path)
    @user = get_user(user_id)

    attachments["movies.csv"] = File.read(file_path)

    mail(to: @user.email, subject: "Your export is ready")
  end

  private

  def get_user(user_id)
    User.find(user_id)
  end
end
