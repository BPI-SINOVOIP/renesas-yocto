MALI_GPU = "${@bb.utils.filter('MACHINE_FEATURES', 'mali-g31 mali-g52', d)}"

# Check GPU
python __anonymous() {
    features = d.getVar("MACHINE_FEATURES")
    MACHINE = d.getVar("MACHINE")
    if "mali-g31" not in features.split():
        raise bb.parse.SkipRecipe(f"The GPU is not suitable with {MACHINE}. Please recheck!")
}
