# Progress log: Poincare3D

An append-only record of what landed on the Poincare3D roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"fc5db6f223041fffebd9cf3b06773a3fb62cc2ba","prs":[33363,33578,33792,33834,33870,33872,33873,33876,33877,34432,35005],"roadmap":"Poincare3D","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10"}-->
## Poincare3D: 2026-11-09 to 2026-11-11 (`fc5db6f` to `e06d672`)

The first pieces of the Poincaré programme to land are its two scalar ends. The extinction argument's one-variable core is now proved. A nonnegative continuous width obeying the forward Dini inequality `D⁺W ≤ -2π + 3W/(1+4t)` cannot survive for all time ([`not_forall_ricciWidth_forward_le`](https://taucetiproject.org/docs/TauCeti/Geometry/RicciFlow/WidthComparison.html#TauCeti.not_forall_ricciWidth_forward_le)). The estimate also carries through finitely many surgery events, each jump error weighted by `(1+4tⱼ)^(-3/4)`, and this gives an explicit extinction-time bound in terms of the initial width and the error budget ([`ricciWidth_time_le_of_forward_le_of_jump_le`](https://taucetiproject.org/docs/TauCeti/Geometry/RicciFlow/WidthComparison.html#TauCeti.ricciWidth_time_le_of_forward_le_of_jump_le)). All of this is about real functions, not flows: no geometric width or Ricci flow exists yet to feed it.

On the surgery side, standard cap profiles are defined and shown to exist ([`exists_isStandardCapProfile`](https://taucetiproject.org/docs/TauCeti/Geometry/RicciFlow/StandardCap/Profile.html#TauCeti.exists_isStandardCapProfile)). These are the radial functions with a round tip `2 sin(r/2)` and a cylindrical end `√2`, and they satisfy the bounds `0 ≤ f′ ≤ 1` and `f″ ≤ 0` that make the cap nonnegatively curved. The cap metric on ℝ³ and its flow are not built yet.

The rest of the window is general analysis aimed at later layers: a two-sided Grönwall inequality from an arbitrary interior time, `Cᵏ` extension across a half-space by higher-order reflection ([`exists_contDiff_extension_halfSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Trace/Reflection/HalfSpace.html#TauCeti.HalfSpaceExtension.exists_contDiff_extension_halfSpace)), uniform jet bounds for families of maps, polar-coordinate integration, which shows that radial graphs are Haar-null, simultaneous isometric limits of compact metric charts, and completeness criteria for comparable metrics.
