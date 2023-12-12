package generator

import (
	"fmt"

	"android/soong/android"
)

func cardinalExpandVariables(ctx android.ModuleContext, in string) string {
	cardinalVars := ctx.Config().VendorConfig("cardinalVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if cardinalVars.IsSet(name) {
			return cardinalVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
