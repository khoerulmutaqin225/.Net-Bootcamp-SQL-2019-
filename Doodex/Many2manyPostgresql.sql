#Master Model
class RequirementDocumentGroup(models.Model):
    _name = 'certification.requirement_group_document'
    _order = 'sequence'
  
    name = fields.Char('Name', required=True)
    repository_version = fields.Many2many(comodel_name="certification.repository_version",
                                          string="Repository Version",
                                          # compute="_compute_repository_version",
                                          store=True,
                                          relation="rev_repo_req_group",
                                          copy=False)    
#Many2many Model

class RepositoryVersion(models.Model):
    _name = 'certification.repository_version'
    _description = 'Repository Version'

    sequence = fields.Integer('Sequence')
    name = fields.Char(string='Version', required=True)

  
#Display name, many2many fields
SELECT r.name, rv.name as repository_version 
FROM certification_requirement_group_document r
LEFT JOIN rev_repo_req_group rg ON r.id = rg.certification_requirement_group_document_id
LEFT JOIN certification_repository_version rv ON rg.certification_repository_version_id = rv.id;
