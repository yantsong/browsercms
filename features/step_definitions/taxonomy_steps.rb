Given /^the following Category Types exist:$/ do |table|
  table.hashes.each do |attributes|
    Factory.create(:category_type, attributes)
  end
end

When /^the following Categories exist for "([^"]*)":$/ do |category_type, table|
  type = Cms::CategoryType.named(category_type).first
  table.hashes.each do |attributes|
    attributes.merge!({:category_type_id => type.id })
    Factory.create(:category, attributes)
  end
end