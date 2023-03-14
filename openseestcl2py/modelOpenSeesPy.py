import openseespy.opensees as ops
ops.geotransform('Linear', IDBeamTransf, 0, -1, 0
)
ops.geotransform('Linear', IDR1Transf, 1, 0, 0
)
ops.geotransform('Linear', IDR2Transf, -1, 0, 0
)
ops.geotransform('Linear', IDColTransf, 0, 1, 0
)
