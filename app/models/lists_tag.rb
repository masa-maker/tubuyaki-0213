class ListsTag
  include ActiveModel::Model
  attr_accessor :info, :name
  with_options presence: true do
    validates :info, length: {maximum: 20}
    validates :name, length: {maximum: 10}
  end 

  def initialize(attribute = {})
    if !(attribute[:id] == nil)
      @list = List.find(attribute[:id])
      @tag = @list.tags
      if !(self.info = attribute[:info])
        self.info = @list.info 
      else
        self.info = attribute[:info]
      end
      if !(self.name = attribute[:name])
        self.name = @tag.name 
      else
        self.name = attribute[:name]
      end
    else
      super(attribute)
    end
  end

  def persisted?
    if @list.nil? 
      return false 
    else
       return @list.persisted?
    end
  end

  
  def save
    list = List.create(info: info)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    TagListRelation.create(list_id: list.id, tag_id: tag.id)
  end

  def update
    @list.update(info: info)
    @tag.update(name: name)
  end
end