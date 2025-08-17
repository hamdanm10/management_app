module FormInstructionHelper
  def form_instruction(resource_name, record)
    action_word = record&.persisted? ? "edit the" : "create a new"
    "Fill out the form below to #{action_word} #{resource_name}."
  end
end