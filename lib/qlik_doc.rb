# coding: utf-8
require 'win32ole'

class QlikDoc < Object
  attr_accessor :qv_app, :qv_doc

public
  def init()
    @qv_app = WIN32OLE.new("QlikTech.QlikView")
  end

  def open_doc(file_path)
    @qv_doc = qv_app.openDoc(file_path)
  end

  def close_doc()
    @qv_doc.closeDoc()
  end

  def quit()
    @qv_app.quit()
  end

  def set_variable(variable_name, variable_value)
    qv_variable = @qv_doc.Variables(variable_name)
    qv_variable.SetContent(variable_value, true)
  end

  def get_variable(variable_name)
    qv_variable = @qv_doc.Variables(variable_name)
    qv_variable.GetContent.String
  end

  def set_selection(field_name, field_value)
    @qv_doc.Fields(field_name).Select(field_value)
  end

  def clear_selection(field_name)
    @qv_doc.Fields(field_name).Clear
  end

  def press_button(object_id)
    qv_button=@qv_doc.GetSheetObject(object_id)
    qv_button.press   
  end
end