class Version < PaperTrail::Version
  self.table_name = :versions
  default_scope { where.not(event: 'create') } 
end