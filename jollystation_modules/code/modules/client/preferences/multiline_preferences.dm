/datum/preference/multiline_text
	abstract_type = /datum/preference/multiline_text
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	priority = PREFERENCE_PRIORITY_NAMES
	can_randomize = FALSE

/datum/preference/multiline_text/apply_to_human(mob/living/carbon/human/target, value)
	if(!value)
		return FALSE

	if(istype(target, /mob/living/carbon/human/dummy))
		return FALSE

	if(!target.linked_flavor)
		return add_mob_flavor_text(target)

	return TRUE

/datum/preference/multiline_text/deserialize(input, datum/preferences/preferences)
	return STRIP_HTML_SIMPLE("[input]", MAX_FLAVOR_LEN)

/datum/preference/multiline_text/serialize(input)
	return STRIP_HTML_SIMPLE(input, MAX_FLAVOR_LEN)

/datum/preference/multiline_text/is_valid(value)
	return istext(value) && !isnull(STRIP_HTML_SIMPLE(value, MAX_FLAVOR_LEN))

/datum/preference/multiline_text/create_default_value()
	return null

/datum/preference/multiline_text/flavor
	savefile_key = "flavor_text"

/datum/preference/multiline_text/flavor/apply_to_human(mob/living/carbon/human/target, value)
	. = ..()
	if(!.)
		return

	target.linked_flavor.flavor_text = value

/datum/preference/multiline_text/exploitable
	savefile_key = "exploitable_info"

/datum/preference/multiline_text/exploitable/apply_to_human(mob/living/carbon/human/target, value)
	. = ..()
	if(!.)
		return

	target.linked_flavor.expl_info = value

/datum/preference/multiline_text/general
	savefile_key = "general_records"

/datum/preference/multiline_text/general/apply_to_human(mob/living/carbon/human/target, value)
	. = ..()
	if(!.)
		return

	target.linked_flavor.gen_records = value

/datum/preference/multiline_text/security
	savefile_key = "security_records"

/datum/preference/multiline_text/security/apply_to_human(mob/living/carbon/human/target, value)
	. = ..()
	if(!.)
		return

	target.linked_flavor.sec_records = value

/datum/preference/multiline_text/medical
	savefile_key = "medical_records"

/datum/preference/multiline_text/medical/apply_to_human(mob/living/carbon/human/target, value)
	. = ..()
	if(!.)
		return

	target.linked_flavor.med_records = value