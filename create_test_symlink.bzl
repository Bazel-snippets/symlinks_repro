def _impl(ctx):
    test_symlink = ctx.actions.declare_symlink('test_symlink')
    ctx.actions.symlink(output = test_symlink, target = ctx.file.src.path)

    # https://docs.bazel.build/versions/master/skylark/lib/actions.html#symlink

    # Accordingly to doc this should work but does not
    ctx.actions.symlink(output = test_symlink, target_file = ctx.file.src)

    # Neither does this:
    test_file = ctx.actions.declare_file('test_file')
    ctx.actions.symlink(output = test_file, target_path = ctx.file.src.path)


create_test_symlink = rule(
    implementation = _impl,
    attrs = {"src": attr.label(allow_single_file = True)},
)
