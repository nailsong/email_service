defmodule EmailService do
  @spec send(String.t()) :: {:ok, :sent}
  def send(email) do
    Process.sleep(3000)
    IO.puts("Email enviado para #{email}")
    {:ok, :sent}
  end

  @spec notify_all([String.t()]) :: :ok
  def notify_all(emails) do
    Enum.each(emails, fn email -> send(email) end)
  end

  def notify_all_async(emails) do
    Enum.each(emails, fn email ->
      Task.start(fn -> send(email) end)
    end)
  end
end
