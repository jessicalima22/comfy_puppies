module ApplicationHelper
  FLASH_CLASSES = {
    'notice' => 'info',
    'success' => 'success',
    'error' => 'danger',
    'alert' => 'warning'
  }.freeze

  def flash_class(type)
    FLASH_CLASSES[type] || type
  end
end
