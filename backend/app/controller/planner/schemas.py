from marshmallow import fields, Schema, EXCLUDE
from marshmallow.validate import Range


class AddPlannedRecipe(Schema):
    class Meta:
        unknown = EXCLUDE

    recipe_id = fields.Integer(
        required=True,
    )
    datetime = fields.DateTime()
    yields = fields.Integer()


class RemovePlannedRecipe(Schema):
    class Meta:
        unknown = EXCLUDE

    datetime = fields.DateTime()
