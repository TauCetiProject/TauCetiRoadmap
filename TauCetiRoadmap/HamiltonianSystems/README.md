# Roadmap: Hamiltonian systems and moment maps

Tau Ceti has the symplectic manifold. It has smooth two-forms on a manifold modelled on any real
normed space (`TauCeti.SmoothTwoForm`), closedness read in charts (`SmoothTwoForm.IsClosed`),
fiberwise nondegeneracy (`SmoothTwoForm.IsNondegenerate`), their conjunction
(`SmoothTwoForm.IsSymplectic`), the canonical form on the linear cotangent models `V × Module.Dual ℝ V`
and `V × StrongDual ℝ V`, and maximal flows of vector fields
(`TauCeti.maximalIntegralCurve`). What it does not have is the mechanics that lives on a symplectic
manifold: the Hamiltonian vector field of a function, the Poisson bracket, conservation laws, the
symplectic nature of Hamiltonian flows, infinitesimal symmetries and their moment maps, and the
cohomological obstruction to equivariance that makes the mass of a Galilean particle a
cohomology class. Mathlib has none of it either: its symplectic content is the matrix group
`Matrix.symplecticGroup`.

This roadmap builds that layer, at the generality of Banach manifolds with a weakly nondegenerate
form (so that phase spaces of field theories fit without change). Its summit is **Souriau's mass
theorem in algebraic form**: for the Galilean Lie algebra acting on the space of motions of a free
particle of mass `m`, the moment map exists, its cocycle is `m` times a fixed 2-cocycle, and the
second cohomology `H²(𝔤𝔞𝔩, ℝ)` is one-dimensional, spanned by that class. The mass of a particle is
the cohomology class of its moment map.

## Standing conventions

These are pinned. Every item below uses them.

- **Setting.** `E` is a real Banach space (`[NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]`,
  the hypothesis under which Mathlib's `VectorField.mlieBracket` API is available), `I : ModelWithCorners ℝ E H`,
  and `M` a manifold with `[IsManifold I ∞ M]`. A symplectic form is `ω : TauCeti.SmoothTwoForm I M`
  with `ω.IsSymplectic`. Nondegeneracy is Tau Ceti's fiberwise `LinearMap.BilinForm.Nondegenerate`,
  that is **weak** nondegeneracy (`v ↦ ω x v` injective). Results needing more carry
  `[FiniteDimensional ℝ E]` or the strong nondegeneracy of Layer 1, and say so.
- **Vector fields** are Mathlib's `(x : M) → TangentSpace I x`, smooth when
  `ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, X x⟩ : TangentBundle I M))`, with Mathlib's bracket
  `VectorField.mlieBracket I` (in a chart, `[U, V] = DV·U - DU·V`). Integral curves are Mathlib's
  `IsMIntegralCurveOn`. The differential of a real function is Mathlib's `mvfderiv I F x`, which
  takes its values in `ℝ` directly (Tau Ceti's `mvfderiv_apply_eq_mfderiv_apply` relates it to
  `mfderiv I 𝓘(ℝ, ℝ) F x`).
- **Hamiltonian vector field:** `ι_{X_F} ω = dF`, that is `ω x (X x) v = mvfderiv I F x v`
  for all `x` and `v`.
- **Poisson bracket:** `{F, G} x = mvfderiv I F x (X_G x)`, so that `{F, G} = ω(X_F, X_G)`
  when `F` is Hamiltonian, and `d/dt F(γ t) = {F, H}(γ t)` along an integral curve `γ` of `X_H`.
  With Mathlib's bracket these conventions give `X_{{F, G}} = -[X_F, X_G]`.
- **Canonical model.** The manifold is `V × StrongDual ℝ V`, since a manifold needs a normed model
  space and `Module.Dual ℝ V` carries no norm in Mathlib. Tau Ceti's
  `strongDualCotangentSymplecticForm` on it is `ω((q, α), (q', β)) = β q - α q'`, the same formula
  as the algebraic `cotangentSymplecticForm` on `V × Module.Dual ℝ V`. Its Hamiltonian vector
  fields are `(∂H/∂α, -∂H/∂q)` (`q̇ = ∂H/∂p`, `ṗ = -∂H/∂q`), where `∂H/∂α` lies in the bidual and is
  read in `V` through the canonical isomorphism when `V` is finite-dimensional; the coordinate
  functions satisfy `{q_i, p_j} = δ_ij`.
- **Infinitesimal action** of a real Lie algebra `𝔤`: a linear map `Z ↦ Z_M` into smooth vector
  fields with `(⁅Z, Z'⁆)_M = -[Z_M, Z'_M]`. This is the relation satisfied by the fundamental vector
  fields of a left action; Layer 3 verifies it on each example.
- **Moment map:** `μ : M → Module.Dual ℝ 𝔤` with `ι_{Z_M} ω = d⟨μ, Z⟩` for every `Z`, each
  `x ↦ μ x Z` smooth.
- **Cocycle of a moment map:** `c(Z, Z') = {μ_Z, μ_Z'} - μ_{⁅Z, Z'⁆}`, a function on `M`. On a
  connected `M` it is constant, and its class lives in the second cohomology of `𝔤` with
  coefficients in `TrivialLieModule ℝ 𝔤 ℝ`, in Mathlib's `LieModule.Cohomology` vocabulary
  (`twoCochain`, `d₁₂`, `twoCocycle`).
- **Dictionary with Souriau** (*Structure des systèmes dynamiques*, 1970; equation numbers of that
  edition). For a symplectic form `σ = ω`:
  - the symplectic gradient `grad u` of (9.16), `-∇u = σ(grad u)`, is `-X_u`;
  - the Poisson bracket (9.22), `σ(grad u)(grad v)`, is `{u, v}`;
  - (9.24), `grad [u, v] = [grad u, grad v]` with Souriau's bracket of vector fields (2.45), which
    is Mathlib's, is `X_{{u, v}} = -[X_u, X_v]`;
  - the moment of (11.7), `σ(Z_V(x)) = -∇[μ.Z]`, is `-μ`.

  Three further differences:
  - Souriau's phase-space form (9.12), `σ(dy)(δy) = dP(δQ) - δP(dQ)` for `y = (P, Q)`, is
    `-cotangentSymplecticForm` under `(P, Q) ↦ (Q, P)`: on the canonical model the dictionary
    applies with `σ = -ω`.
  - Souriau defines the bracket of `𝔤` by `[Z, Z']_V = [Z_V, Z'_V]` ((6.12 b), with the bracket of
    vector fields (2.45)), so that `Z ↦ Z_V` is a homomorphism. For the same vector fields, his
    bracket on `𝔤` is therefore the opposite of the one pinned here; on the Galilean Lie algebra it
    is the opposite of the matrix commutator.
  - With `σ = ω`, his cocycle `f` of (11.17) is the `c` of this roadmap.

## What Mathlib and Tau Ceti already have (consume)

- **Tau Ceti, symplectic layer.** The two-form carrier is used through the API listed here;
  *Relation to sibling roadmaps* says how that use follows the carrier.
  - Smooth two-forms and their API: `TauCeti.SmoothTwoForm`, evaluation `form x v w`,
    `SmoothTwoForm.bilinFormAt`, `SmoothTwoForm.contMDiff_apply` (smoothness of `ω(U, V)`), and
    `SmoothTwoForm.const` for a continuous alternating bilinear form on a model space.
  - Closedness in charts: `SmoothTwoForm.IsClosed`, `SmoothTwoForm.inChartAt`,
    `SmoothTwoForm.isClosed_iff_forall_extDerivWithin_inChartAt_self`, `SmoothTwoForm.isClosed_const`.
  - Nondegeneracy and symplectic forms: `SmoothTwoForm.IsNondegenerate`,
    `SmoothTwoForm.isNondegenerate_iff_separatingLeft`, `SmoothTwoForm.IsSymplectic`,
    `SymplecticForm.constSmooth`, `SymplecticForm.isSymplectic_constSmooth`.
  - The linear symplectic form `TauCeti.SymplecticForm`, `SymplecticForm.IsSymplectomorphism` (a
    predicate on a linear equivalence), `SymplecticForm.transport`, and the binary product
    `SymplecticForm.prod`.
  - Cotangent models: `cotangentSymplecticForm` on `V × Module.Dual ℝ V`;
    `strongDualCotangentSymplecticForm` on `V × StrongDual ℝ V`, for any normed `V`;
    `cotangentLiouvilleForm`; `stdSymplecticForm` on `V × V` for an inner product space `V`, with
    `isSymplectomorphism_cotangentModelEquiv`.
- **Tau Ceti, flows.**
  - `maximalIntegralCurve`, `maximalIntegralCurveInterval`, `maximalIntegralCurveFlowDomain`,
    `isOpen_maximalIntegralCurveFlowDomain`, the flow law `maximalIntegralCurve_add`, and
    `contMDiffOn_maximalIntegralCurve` (finite dimension, boundaryless, Hausdorff).
  - `IsMIntegralCurveOn.map_of_mfderiv_eq`, and `mvfderiv_mlieBracket` (the manifold bracket read
    through a differential).
- **Mathlib, differential calculus.**
  - `extDeriv` and `extDerivWithin` on normed spaces, with `extDeriv_apply_vectorField`, the
    invariant formula for `dω` evaluated on vector fields.
  - `VectorField.lieBracket` and `VectorField.mlieBracket`, `ContMDiffAt.mlieBracket_vectorField`,
    `VectorField.leibniz_identity_mlieBracket`.
  - Integral curves (`IsMIntegralCurveOn`, `exists_isMIntegralCurveAt_of_contMDiffAt_boundaryless`),
    smooth functions `C^∞⟮I, M; ℝ⟯` with their algebra structure, `contDiffAt_map_inverse`.
- **Mathlib, Lie algebras.**
  - `LieRing`, `LieAlgebra`, `LieSubalgebra`, the commutator Lie algebra of matrices, and
    `skewAdjointLieSubalgebra`.
  - `TrivialLieModule`, and `LieModule.Cohomology.twoCochain`, `d₁₂`, `twoCocycle`,
    `mem_twoCocycle_iff_of_trivial`.
  - The central extension of a Lie algebra by a 2-cocycle, `LieAlgebra.ofTwoCocycle`, with
    `LieAlgebra.bracket_ofTwoCocycle`.

## What is missing (build here)

- Hamiltonian vector fields, Hamiltonian functions, and the Poisson bracket on a weakly symplectic
  Banach manifold; the Lie algebra of Hamiltonian functions.
- Two degree-two cases of the calculus of differential forms, which the differential geometry
  roadmap owns (see *Relation to sibling roadmaps*): the invariant formula for a closed two-form
  on a manifold, and the pullback of a two-form.
- Symplectic maps and symplectomorphisms between manifolds, conservation laws, and symplecticity
  of Hamiltonian flows.
- The canonical model in coordinates, on `(Fin n → ℝ) × (Fin n → ℝ)` and on `Fin (2 * n) → ℝ`.
- Infinitesimal actions, moment maps, their cocycle and its class.
- 2-coboundaries and `H²` of a Lie algebra with trivial coefficients, which Mathlib does not
  have: `twoCoboundary` (the range of `d₁₂`) and `secondCohomology` (the 2-cocycles modulo the
  2-coboundaries) in `LieModule.Cohomology`, next to Mathlib's `twoCocycle`.
- The Galilean Lie algebra and the space of motions of a free particle.

## The build, in layers

The ordering is the dependency order. Layer 1 is the substrate of everything else. Layers 2 and 3
both consume Layer 1 and may proceed in parallel.

### Layer 1: Hamiltonian vector fields and the Poisson bracket

- **Hamiltonian vector fields.**
  - The predicate `IsHamiltonianVectorField ω F X`.
  - The pointwise `hamiltonianVectorField ω F x`: a vector `v` with `ω x v = dF_x` when one
    exists (it is unique when `ω` is nondegenerate), `0` otherwise.
  - The predicate `IsHamiltonian ω F`: `F` is smooth and admits a smooth Hamiltonian vector field.
  - Uniqueness, from weak nondegeneracy.
  - `mvfderiv I F x` is `0` where `F` is not differentiable, and `hamiltonianVectorField ω F x` is
    `0` where `dF_x` is not of the form `ω x v`. The next three items therefore carry hypotheses:
    `F` *has a Hamiltonian vector at* `x` when `ω x v = dF_x` for some `v`.
  - Linearity. If `X`, `Y` are Hamiltonian vector fields of `F`, `G`, and `F`, `G` are
    differentiable, then `a • X + b • Y` is a Hamiltonian vector field of `a • F + b • G`. For `ω`
    nondegenerate, `X_{aF + bG} x = a X_F x + b X_G x` when `F` and `G` are differentiable at `x`
    and have Hamiltonian vectors at `x`.
  - For `ω` nondegenerate and `X` a Hamiltonian vector field of `F`, `X x = 0` exactly when
    `dF_x = 0`.
  - Leibniz. Under the hypotheses of linearity, `F • Y + G • X` is a Hamiltonian vector field of
    `F * G`, and `X_{FG} x = F x • X_G x + G x • X_F x`.
  - Locality: `X_F` at `x` depends only on the germ of `F` at `x`.
- **Strong nondegeneracy.**
  - `ω` is strongly nondegenerate when, at every point, `v ↦ ω x v` is onto
    `TangentSpace I x →L[ℝ] ℝ`.
  - A strongly nondegenerate form is nondegenerate (`IsStronglyNondegenerate.isNondegenerate`):
    if `ω x w = 0`, every `ω x v` vanishes at `w` by antisymmetry, hence every continuous linear
    form does, and `w = 0` by the Hahn-Banach theorem.
  - A nondegenerate form on a finite-dimensional manifold is strongly nondegenerate.
  - For a strongly nondegenerate `ω`, every smooth function is Hamiltonian and
    `hamiltonianVectorField ω F` is smooth. The inverse of `v ↦ ω x v` is a continuous linear
    equivalence by the open mapping theorem, and its smooth dependence on `x` comes from
    `contDiffAt_map_inverse` in charts.
- **The Poisson bracket** `poissonBracket ω F G`, with the pinned definition. It is `dF (X_G)`,
  so its two arguments carry different hypotheses.
  - It is linear in `F`: `{aF + bF', G} x = a {F, G} x + b {F', G} x` when `F` and `F'` are
    differentiable at `x`, for every `G`.
  - It is linear in `G`: `{F, aG + bG'} x = a {F, G} x + b {F, G'} x` when `ω` is nondegenerate and
    `G`, `G'` are differentiable at `x` and have Hamiltonian vectors at `x`, for every `F`.
  - It is antisymmetric on Hamiltonian functions, and equals `ω(X_F, X_G)` there.
  - It satisfies the Leibniz rule in each argument:
    `{FF', G} x = F x * {F', G} x + F' x * {F, G} x` under the hypotheses of linearity in `F`, and
    `{F, GG'} x = {F, G} x * G' x + G x * {F, G'} x` under those of linearity in `G`.
  - `{F, G}` is smooth when `F` and `G` are Hamiltonian.
- **The invariant formula for a closed two-form on a manifold.** For a closed smooth two-form `ω`
  and vector fields `U`, `V`, `W` that are smooth near `x`,
  `U(ω(V, W)) - V(ω(U, W)) + W(ω(U, V)) - ω([U, V], W) + ω([U, W], V) - ω([V, W], U) = 0` at `x`.
  - The directional derivatives are `mvfderiv` of the evaluated functions.
  - The left-hand side is `dω(U, V, W)` at `x`, in the normalization of Mathlib's `extDeriv`.
    This item is the degree-two case, for a closed form, of the invariant formula for the
    exterior derivative through `mlieBracket`, which the differential geometry roadmap owns (see
    *Relation to sibling roadmaps*). It is the only invariant formula stated in this roadmap.
  - Against the carrier `SmoothTwoForm`, whose closedness is read in charts, it is obtained from
    Mathlib's `extDeriv_apply_vectorField` in the chart at `x`, through `SmoothTwoForm.inChartAt`
    and the chart description of `mlieBracket`.
  - The statement is local, so it needs no global extension of tangent vectors to vector fields
    (smooth bump functions need not exist on a Banach manifold).
- **Milestone 1: Hamiltonian functions form a Lie algebra.** For `ω` symplectic and `F`, `G`
  Hamiltonian, `{F, G}` is Hamiltonian with `X_{{F, G}} = -[X_F, X_G]`, and the Jacobi identity
  holds. The Hamiltonian functions form a real Lie algebra under `{·, ·}` (bundled as `LieRing` and
  `LieAlgebra ℝ` on the subtype) and a subalgebra of `C^∞⟮I, M; ℝ⟯` for the pointwise product,
  related by the Leibniz rule. The map `F ↦ X_F` is linear, sends `{F, G}` to `-[X_F, X_G]`, and
  has as kernel the functions with `dF = 0`: the constants when `M` is preconnected.
- **Examples and acceptance tests.**
  - On a real finite-dimensional `V`, `SymplecticForm.constSmooth strongDualCotangentSymplecticForm`
    on `V × StrongDual ℝ V` is symplectic.
  - Its Hamiltonian vector fields are `(∂H/∂α, -∂H/∂q)`, with `∂H/∂α` read in `V` through the
    canonical isomorphism of `V` with its bidual.
  - For a basis of `V`, the coordinate functions satisfy `{q_i, p_j} = δ_ij`, `{q_i, q_j} = 0` and
    `{p_i, p_j} = 0`.
  - On any real Banach space `V`, the canonical form on `V × StrongDual ℝ V`, packaged as a
    constant `SmoothTwoForm` through `SmoothTwoForm.const`, is symplectic (weakly nondegenerate)
    and is strongly nondegenerate exactly when `V` is reflexive, that is, when
    `NormedSpace.inclusionInDoubleDual ℝ V` is surjective. This constant packaging is itself a
    target.

### Layer 2: dynamics

- **Conservation along integral curves.** Let `γ` be an integral curve of `X_H` on an open set `s`
  of times (`IsMIntegralCurveOn γ X_H s`).
  - The derivative. For `t ∈ s` and `F` differentiable at `γ t`, `F ∘ γ` has derivative
    `{F, H} (γ t)` at `t`.
  - Constancy is stated on a preconnected set of times `T ⊆ s`, that is, on an interval. If `F`
    is differentiable and `{F, H} (γ t) = 0` for every `t ∈ T`, then `F (γ t₁) = F (γ t₂)` for
    all `t₁`, `t₂` in `T`. This covers `T = s` when `s` is an interval, and each connected
    component of `s` in general. The values on two components of `s` need not agree: on the
    canonical plane, for `H (q, p) = p` and `s = (-2, -1) ∪ (1, 2)`, the curve equal to `(t, 0)`
    on the first interval and to `(t, 1)` on the second is an integral curve of `X_H = (1, 0)`
    on `s`, and `H` takes the values `0` and `1` along it.
  - Conservation of energy. `{H, H} = 0` for every function `H`: at each point, `X_H` is either
    a vector `v` with `ω x v = dH_x`, and then `dH_x v = ω x v v = 0`, or `0`. So a
    differentiable `H` takes the same value at any two times of a preconnected `T ⊆ s`.
    Differentiability of `H` is the only hypothesis: it is the hypothesis on `F` of the
    derivative statement, used with `F = H` at every time of `T`.
  - On a boundaryless manifold, for `ω` nondegenerate, `H` Hamiltonian (so that `X_H` is smooth
    and local integral curves exist through every point) and `F` differentiable, `{F, H} = 0` if
    and only if `F ∘ γ` is constant for every integral curve `γ` of `X_H` on an open interval.
  - First integrals are closed under the Poisson bracket (Poisson's theorem, from the Jacobi
    identity): for `ω` symplectic and `F`, `G`, `H` Hamiltonian, if `{F, H} = 0` and
    `{G, H} = 0`, then `{{F, G}, H} = 0`.
- **Symplectic maps and symplectomorphisms.**
  - The pullback `SmoothTwoForm.pullback` of a smooth two-form `ω'` on `M'` along a smooth map
    `φ : M → M'`: `(φ^* ω') x v w = ω' (φ x) (dφ v) (dφ w)`, with `dφ = mfderiv I I' φ x`. It is
    compatible with the identity, composition, `add` and `smul`, and the pullback of a closed
    form is closed (`pullback_isClosed`). It is the pullback of differential forms in degree
    two, which the differential geometry roadmap owns, and not a second pullback: its defining
    equation and its laws are the degree-two cases of the generic ones, and `pullback_isClosed`
    is the degree-two case of the naturality of the exterior derivative (see *Relation to
    sibling roadmaps*).
  - A map `φ : M → M'` is a symplectic map from `ω` to `ω'` when
    `ω' (φ x) (dφ v) (dφ w) = ω x v w` everywhere; for `φ` smooth, exactly when `φ^* ω' = ω`. The
    model spaces of `M` and `M'` may differ: symplectic embeddings are symplectic maps.
  - A symplectomorphism from `ω` to `ω'` is a `Diffeomorph` (`φ : M ≃ₘ^n⟮I, I'⟯ M'`, with `n ≠ 0`)
    that is a symplectic map. Like `SymplecticForm.IsSymplectomorphism`, it is a predicate on an
    equivalence.
  - Identities and compositions of differentiable symplectic maps are symplectic maps, and the
    inverse of a symplectomorphism is a symplectomorphism.
  - The differential of a symplectic map from a nondegenerate `ω` is injective at every point.
  - A symplectomorphism `φ` to a nondegenerate `ω'` transports Hamiltonian vector fields
    (`dφ (X_{H ∘ φ} x) = X_H (φ x)`), Poisson brackets
    (`{F ∘ φ, G ∘ φ} = {F, G} ∘ φ`), and integral curves (through
    `IsMIntegralCurveOn.map_of_mfderiv_eq`), for all functions `H`, `F`, `G`. A symplectic map
    that is not a diffeomorphism need not: `dφ` has to be onto.
  - A linear symplectomorphism `e` of finite-dimensional symplectic vector spaces
    (`SymplecticForm.IsSymplectomorphism`) is a symplectomorphism of the constant forms, as the
    diffeomorphism `e.toContinuousLinearEquiv.toDiffeomorph`.
  - Open subsets. For `U : TopologicalSpace.Opens M`, the restriction of `ω` to `U` is its
    pullback along `Subtype.val`, and is symplectic when `ω` is. For `ω` nondegenerate,
    `Subtype.val` transports Hamiltonian vector fields and Poisson brackets as a symplectomorphism
    does. A canonical transformation between open subsets `U` of `M` and `U'` of `M'` is a
    symplectomorphism between `U` and `U'` for the restricted forms.
- **Canonical coordinates.** The flat theory in coordinates is the canonical model read in a
  basis. It uses the Hamiltonian vector field and the Poisson bracket of Layer 1, and defines no
  others.
  - The coordinate model. On `(Fin n → ℝ) × (Fin n → ℝ)`, with points `(q, p)`, the form is
    `ω((q, p), (q', p')) = p' ⬝ᵥ q - p ⬝ᵥ q'`, that is `Σ_i dq_i ∧ dp_i`. It is the pullback of
    `cotangentSymplecticForm` on `(Fin n → ℝ) × Module.Dual ℝ (Fin n → ℝ)` by
    `(q, p) ↦ (q, p ⬝ᵥ ·)`, that is Mathlib's `dotProductEquiv ℝ (Fin n)` on the second factor:
    its `SymplecticForm.transport` along the inverse of that equivalence. It is made a smooth
    form by `SymplecticForm.constSmooth`. The same map, with `p ⬝ᵥ ·` read as a continuous
    linear form, is a linear symplectomorphism onto the canonical model `V × StrongDual ℝ V`
    for `V = Fin n → ℝ`. The form of Milestone 3 is the case `n = 3`.
  - Hamilton's equations. Write `∂H/∂q_i = fderiv ℝ H x (Pi.single i 1, 0)` and
    `∂H/∂p_i = fderiv ℝ H x (0, Pi.single i 1)`. For `H` differentiable at `x`,
    `X_H x = (∂H/∂p, -∂H/∂q)`. For `H` differentiable, a curve `t ↦ (q t, p t)` is an integral
    curve of `X_H` on an open set `s` of times exactly when `q_i' = ∂H/∂p_i` and
    `p_i' = -∂H/∂q_i` along the curve, at every time of `s`.
  - The bracket in coordinates. For `F` and `G` differentiable at `x`,
    `{F, G} x = Σ_i (∂F/∂q_i ∂G/∂p_i - ∂F/∂p_i ∂G/∂q_i)`.
  - Reindexing. `Fin (2 * n) → ℝ` carries the transport of this form along the linear
    equivalence `(Fin n → ℝ) × (Fin n → ℝ) ≃ₗ[ℝ] (Fin (2 * n) → ℝ)` sending `(q, p)` to the
    vector `x` with `x_i = q_i` and `x_{n+i} = p_i` for `i < n`, that is
    `ω(x, y) = Σ_{i<n} (x_i y_{n+i} - x_{n+i} y_i)`. That equivalence is a linear
    symplectomorphism by construction, hence a symplectomorphism of the constant forms by the
    item above. So the Hamiltonian vector fields, Poisson brackets and integral curves of
    `Fin (2 * n) → ℝ` are the transported ones, and Hamilton's equations and the bracket formula
    hold there with `∂/∂x_i` and `∂/∂x_{n+i}` in place of `∂/∂q_i` and `∂/∂p_i`.
  - Open sets. By the item on open subsets, for an open subset `U` of either model with the
    restricted form, and `x ∈ U`, the Hamiltonian vector field of `H ∘ Subtype.val` at `x` is
    sent to `X_H x` by the differential of `Subtype.val`, and
    `{F ∘ Subtype.val, G ∘ Subtype.val} x = {F, G} x`: the same formulas hold on `U`. A canonical
    change of variables between open subsets `U`, `U'` is a symplectomorphism `φ` between them.
    It transports Hamiltonians (`H ↦ H ∘ φ`), Hamiltonian vector fields, Poisson brackets,
    integral curves, and first integrals (the functions `F` with `{F, H} = 0`).
- **The variational equation.** Let `X` be a smooth vector field on a finite-dimensional,
  boundaryless, Hausdorff manifold, `x ∈ M`, `v ∈ T_x M`, and `φ_s = fun y ↦ maximalIntegralCurve X y s`.
  For `s₀` with `(x, s₀) ∈ maximalIntegralCurveFlowDomain X`, write `X̃` for the coordinate
  expression of `X` in the chart at `φ_{s₀} x` and `J(s)` for the coordinate expression of
  `mfderiv I I φ_s x v` in that chart. Then, for `s` near `s₀`, `J'(s) = DX̃(φ̃_s x) (J s)`, where
  `φ̃_s x` is the chart coordinate of `φ_s x`. This follows from the joint smoothness of the flow
  (`contMDiffOn_maximalIntegralCurve`) and the symmetry of second derivatives.
- **Milestone 2: Hamiltonian flows are symplectic.** In the same finite-dimensional setting, for
  `H` smooth and `ω` symplectic, let `(x, t) ∈ maximalIntegralCurveFlowDomain (X_H)` and
  `φ_t = fun y ↦ maximalIntegralCurve X_H y t`. Then
  `ω (φ_t x) (dφ_t v) (dφ_t w) = ω x v w`. Also, `H (φ_t x) = H x`, and `F (φ_t x) = F x` for
  every differentiable `F` with `{F, H} = 0`: the times `0` and `t` lie in the interval of
  existence `maximalIntegralCurveInterval X_H x`, which is preconnected.
- **Liouville's theorem.** For a symplectic form on a finite-dimensional real vector space `V`
  (`SymplecticForm.constSmooth`), `H` smooth, and `(x, t)` in the flow domain of `X_H`,
  `(fderiv ℝ φ_t x).det = 1`. Hence `φ_t` preserves the additive Haar measure `μ` of `V`:
  `μ (φ_t '' s) = μ s` for every measurable set `s` on which `φ_t` is defined.

### Layer 3: infinitesimal symmetries and moment maps

- **Infinitesimal actions.** A structure holding a real Lie algebra `𝔤`, a linear map
  `𝔤 →ₗ[ℝ] ((x : M) → TangentSpace I x)` with smooth values, and the pinned relation
  `(⁅Z, Z'⁆)_M = -[Z_M, Z'_M]`. It is Hamiltonian when it admits a moment map.
- **Moment maps.**
  - The predicate `IsMomentMap ω a μ`.
  - Uniqueness: two moment maps `μ`, `μ'` of the same action differ by a function
    `ν : M → Module.Dual ℝ 𝔤` each of whose components `x ↦ ν x Z` has vanishing differential
    (`Module.Dual ℝ 𝔤` carries no norm, so the statement is componentwise). Hence, when `M` is
    preconnected, `μ' = μ + ν` for a constant `ν : Module.Dual ℝ 𝔤`; this `ν` is unique when `M`
    is moreover nonempty.
  - **Noether's theorem:** if `H` is invariant (`dH (Z_M) = 0`), then `{μ_Z, H} = 0`. Hence, along
    an integral curve `γ` of `X_H` on an open set `s` of times, `μ_Z ∘ γ` has derivative `0` at
    every time of `s`, and takes the same value at any two times of a preconnected `T ⊆ s`. This
    is the conservation item of Layer 2 for `F = μ_Z`, which is smooth; as there, the values on
    two connected components of `s` need not agree.
- **The cocycle.** Let `μ` be a moment map, and `ω` closed.
  - The cocycle at a point. For `x : M`, `c_x(Z, Z') = {μ_Z, μ_Z'} x - μ x ⁅Z, Z'⁆`. It equals
    `ω x (Z_M x) (Z'_M x) - μ x ⁅Z, Z'⁆`, so it is bilinear and alternating in `(Z, Z')`, and it
    is a 2-cocycle: `c_x` is an element of
    `LieModule.Cohomology.twoCocycle ℝ 𝔤 (TrivialLieModule ℝ 𝔤 ℝ)`, whose value on `(Z, Z')` is
    `c_x(Z, Z')` read through `TrivialLieModule.equiv`. No connectedness or nonemptiness of `M`
    is involved.
  - The shift at a point. For a constant `ν : Module.Dual ℝ 𝔤`, `μ + ν` is a moment map, and its
    cocycle at `x` is `c_x(Z, Z') - ν ⁅Z, Z'⁆`: the cocycle of `μ` at `x` plus `d₁₂ ν`, in
    Mathlib's convention (`d₁₂ ν (Z, Z') = -ν ⁅Z, Z'⁆` for trivial coefficients). More generally,
    the cocycle at `x` of another moment map `μ'` of the same action is `c_x + d₁₂ (μ' x - μ x)`.
    No connectedness or nonemptiness of `M` is involved.
  - Independence of the point. Each function `x ↦ c_x(Z, Z')` has vanishing differential, since
    `-[Z_M, Z'_M] - (⁅Z, Z'⁆)_M = 0` is a Hamiltonian vector field of it. So `c_x = c_y` for all
    `x`, `y` when `M` is preconnected.
  - The cocycle of `μ`. On a connected `M` (`[ConnectedSpace M]`: preconnected and nonempty),
    the cocycle `c_μ` of `μ` is `c_x` for a point `x` of `M`, and does not depend on that
    point. It is the only 2-cochain satisfying the evaluation equation
    `c_μ(Z, Z') = c_x(Z, Z')` for every `x`, and it satisfies the shift equation
    `c_{μ + ν} = c_μ + d₁₂ ν` for every constant `ν`. Nonemptiness cannot be dropped. On the
    empty manifold the evaluation equation holds for every 2-cochain, and `μ + ν = μ` for every
    `ν`, so no cocycle depending on `μ` alone satisfies the shift equation as soon as some
    `d₁₂ ν` is nonzero: for the Lie algebra with basis `h`, `e` and `⁅h, e⁆ = e`, and `ν e = 1`,
    `d₁₂ ν (h, e) = -1`.
  - The class. On a connected `M`, the class of `c_μ` in `H²(𝔤, ℝ)` (built here:
    `twoCoboundary`, `secondCohomology`) is the same for all moment maps of the action, by
    uniqueness and the shift equation: it is an invariant of the Hamiltonian action.
  - On a connected `M`, the action has an infinitesimally equivariant moment map
    (`{μ'_Z, μ'_Z'} = μ'_{⁅Z, Z'⁆}`), necessarily of the form `μ' = μ + ν`, if and only if the
    class vanishes.
  - On a connected `M`, the central extension `LieAlgebra.ofTwoCocycle` of `𝔤` by `c_μ` acts
    through the vector fields `(Z, s) ↦ Z_M`, and `(Z, s) ↦ μ_Z + s` is an equivariant moment map
    for it: the obstruction disappears on the central extension.
  - The manifolds of the examples below and of Milestone 3 are real normed spaces, which are
    connected.
- **Examples and acceptance tests.**
  - *Translations.* The abelian Lie algebra `V` acts on a symplectic Banach space `(V, ω)` by
    constant vector fields. Its carrier is a type synonym of `V` with the zero bracket (`LieRing`,
    `LieAlgebra ℝ`, `IsLieAbelian`), built here: Mathlib has no Lie algebra structure with zero
    bracket on a bare module.
    - The moment map is `μ_Z(x) = ω(Z, x)`.
    - The cocycle is `c = ω`, and its class is nonzero when `ω ≠ 0`, in every dimension: the
      Heisenberg extension.
  - *Linear symplectic action.* For finite-dimensional `(V, ω)`, the Lie algebra
    `skewAdjointLieSubalgebra` of `ω` acts by `A ↦ (x ↦ A x)`.
    - The moment map is `μ_A(x) = ½ ω(A x, x)`.
    - It is equivariant: the cocycle is zero.
  - *Cotangent lift.* For finite-dimensional `V`, `Module.End ℝ V` acts on `V × StrongDual ℝ V` by
    `A ↦ ((q, α) ↦ (A q, -(α ∘L A)))`, with `A` read as a continuous linear map
    (`LinearMap.toContinuousLinearMap`).
    - The moment map is `μ_A(q, α) = α (A q)`.
    - It is equivariant.
- **Milestone 3: Souriau's mass theorem, algebraic form.**
  - **The Galilean Lie algebra.** `𝔤𝔞𝔩` is the Lie subalgebra of `Matrix (Fin 5) (Fin 5) ℝ` of the
    matrices `[[j(ρ), β, γ], [0, 0, ε], [0, 0, 0]]` in blocks of sizes `3, 1, 1`, where `ρ, β, γ` are
    in `Fin 3 → ℝ`, `ε ∈ ℝ`, and `j(ρ)` is the skew matrix with `j(ρ) *ᵥ v = ρ ⨯₃ v`. It has
    dimension 10. `ρ` is an infinitesimal rotation, `β` a boost, `γ` a space translation and `ε` a
    time translation, acting on space-time by `(x, t) ↦ (j(ρ) x + t β + γ, ε)`.
  - **The space of motions** of a free particle of mass `m > 0` is
    `(Fin 3 → ℝ) × (Fin 3 → ℝ)` (position `q` and momentum `p` at time `0` of the straight line
    `t ↦ q + (t / m) • p`), with `ω((q, p), (q', p')) = p' ⬝ᵥ q - p ⬝ᵥ q'`: the canonical form of
    the Standing conventions, through the identification of `Fin 3 → ℝ` with its dual by `⬝ᵥ`.
    - Positions and momenta are in `Fin 3 → ℝ`, where `⨯₃` and `⬝ᵥ` are defined; it carries no
      inner product.
    - The form is the pullback of `cotangentSymplecticForm` on
      `(Fin 3 → ℝ) × Module.Dual ℝ (Fin 3 → ℝ)` by `(q, p) ↦ (q, p ⬝ᵥ ·)`, that is Mathlib's
      `dotProductEquiv ℝ (Fin 3)` on the second factor: its `SymplecticForm.transport` along the
      inverse of that equivalence. It is made a smooth form by `SymplecticForm.constSmooth`.
    - Through `EuclideanSpace.equiv (Fin 3) ℝ` on each factor, it is Tau Ceti's `stdSymplecticForm`
      on `EuclideanSpace ℝ (Fin 3) × EuclideanSpace ℝ (Fin 3)`; this comparison is a target.
  - **The action** of `Z = (ρ, β, γ, ε)` is the transport of its action on space-time to straight
    lines: `Z_M(q, p) = (ρ ⨯₃ q + γ - (ε / m) • p, ρ ⨯₃ p + m • β)`.
  - **Targets.**
    - This is an infinitesimal action in the pinned sense, for the commutator bracket of matrices.
    - `μ_Z(q, p) = ρ ⬝ᵥ (q ⨯₃ p) + γ ⬝ᵥ p - m (β ⬝ᵥ q) - ε (p ⬝ᵥ p) / (2 m)` is a moment map
      (angular momentum, momentum, `-m q`, and `-` the kinetic energy).
    - Its cocycle is `c(Z, Z') = m f₀(Z, Z')` with `f₀(Z, Z') = β' ⬝ᵥ γ - β ⬝ᵥ γ'`. In particular
      the boost `B e₁` (`β = e₁`) and the translation `T e₁` (`γ = e₁`) commute and
      `c(B e₁, T e₁) = -m`.
    - `H²(𝔤𝔞𝔩, ℝ)` is one-dimensional: every 2-cocycle `c'` is a coboundary plus
      `(-c'(B e₁, T e₁)) • f₀`, and `f₀` is not a coboundary.
    - The class of the free particle of mass `m` is `m [f₀]`: nonzero, and proportional to the
      mass.
  - **The `N`-particle version.** For free particles of masses `m_j`, indexed by a `Fintype` `ι`,
    on the product `ι → (Fin 3 → ℝ) × (Fin 3 → ℝ)` of their spaces of motions with the sum of the
    forms and the diagonal action, the class is `(Σ m_j) [f₀]`: the total mass. The sum of the
    forms is `SymplecticForm.pi`, the product of a finite family of linear symplectic forms, built
    here next to Tau Ceti's binary `SymplecticForm.prod`.

## Boundaries

- **Heegaard Floer (analytic).** Almost complex structures, `J`-holomorphic curves, Lagrangian
  Floer theory, and the Darboux and Moser theorems belong to that roadmap; this roadmap uses none of
  them.
- **Lie groups.** Group-level objects are not in this roadmap:
  - actions of Lie groups and their fundamental vector fields;
  - group-level equivariance of moment maps and the symplectic cocycle `θ : G → 𝔤*` of a group
    action;
  - coadjoint orbits and their Kirillov-Kostant-Souriau form;
  - symplectic reduction.
  They need the exponential map and `Ad` of the Lie groups roadmap
  (`RepresentationTheory/LieGroups`), and this roadmap does not depend on it.
- **Poisson manifolds.** General Poisson manifolds, the Lie-Poisson structure on the dual of a Lie
  algebra, and the statement that a moment map is a Poisson map are not in this roadmap.
- **Cotangent bundles, Lagrangian mechanics and integrable systems.** The cotangent bundle `T*Q`
  of a manifold `Q` with its Liouville and canonical forms (only the linear models
  `V × StrongDual ℝ V` are treated here), the Euler-Lagrange equations, the Legendre transform,
  Liouville-Arnold, action-angle variables and KAM theory are not in this roadmap. A roadmap on
  them consumes Layers 1 and 2.
- **Volume.** The Liouville volume form `ωⁿ` and the Liouville measure of a symplectic manifold
  are not in this roadmap. Liouville's theorem is stated in Layer 2 on a symplectic vector space.
- **Infinite dimensions.** The Hamiltonian formalism of Layers 1 and 3 is proved on Banach
  manifolds with weakly nondegenerate forms. Existence and smoothness of flows (Layer 2) use Tau
  Ceti's finite-dimensional flow theory. Partial differential equations and specific field theories
  are not in this roadmap.

## Relation to sibling roadmaps

One owner per shared construction. Each entry states this roadmap's side of the boundary.

- **Differential geometry (#178)** owns the calculus of differential forms on manifolds: the
  generic carrier `SmoothForm I M F k` and the move of Tau Ceti's `SmoothTwoForm` onto
  `SmoothForm I M ℝ 2` (its Layer 0.4), the pullback `mpullback` (0.3), the exterior derivative
  `mextDeriv` (1.1), its naturality `mpullback_mextDeriv` (1.2), and the invariant formulas
  through `mlieBracket` (1.4). This roadmap owns no calculus of forms. It consumes that one in
  degree two.
  - The pullback. `SmoothTwoForm.pullback` (Layer 2) is `mpullback` in degree two. On the
    generic carrier it is that pullback, or an adapter of it with the same defining equation;
    its laws are the degree-two cases of the generic ones, and `pullback_isClosed` is
    `mpullback_mextDeriv` applied to a closed form.
  - The invariant formula. The six-term formula (Layer 1) is the invariant formula of 1.4 in
    degree two, applied to a closed form. This roadmap uses it at a point, for vector fields
    smooth near that point. If the generic formula is stated for vector fields defined on all
    of `M`, the six-term statement is kept, and is derived from the generic formula on an open
    neighbourhood of the point.
  - Flows. Milestone 2 (Layer 2) says that the flow of `X_H` preserves `ω`. #178 also lists
    Cartan's formula (1.4) and Lie derivatives of forms via flows (3.4). With them, Milestone 2
    follows from the vanishing of the Lie derivative of `ω` along `X_H`, which is
    `d(ι_{X_H} ω) + ι_{X_H} dω = d(dH) + 0`. The variational equation (Layer 2) is a statement
    about the flow of a vector field, with no form in it.
  - One implementation. Against `SmoothTwoForm` as a carrier of its own, with closedness read in
    charts, the pullback, the six-term formula and Milestone 2 are proved in charts, Milestone 2
    through the variational equation, with the statements written in Layers 1 and 2. On the
    generic carrier they are derived from the generic statements, and the chart proofs are
    deleted. No wedge product, exterior derivative, Lie derivative, or pullback in another
    degree is built here.
  - The carrier. The declarations of Layers 1 to 3 take `ω : SmoothTwoForm I M`, and their
    statements use it through its evaluation `ω x v w`, the smoothness of `ω(U, V)`, the
    predicates `IsClosed`, `IsNondegenerate` and `IsSymplectic`, the constant forms, and the
    pullback. Layer 0.4 of #178 asks that the evaluation, the smooth evaluation and the
    constant forms follow from the generic API, and that closedness, nondegeneracy and the
    symplectic predicate be preserved; the pullback is the `mpullback` of its Layer 0.3. So
    these statements follow the carrier. On `SmoothForm I M ℝ 2` they are written with
    evaluation spelled as Layer 0.4 fixes it for degree-two forms, under the name
    `SmoothTwoForm` if that layer retains it as an abbreviation and in the namespace of the
    generic carrier otherwise, and are otherwise unchanged. Carrying them over is this
    roadmap's work: its declarations implemented before that move are ported to the generic
    carrier when it happens, and those implemented after are written on it. There is no second
    carrier of two-forms.
- **Planar restricted three-body problem (#151).** This roadmap owns the Hamiltonian vector
  field and the Poisson bracket (`hamiltonianVectorField`, `poissonBracket`) with their laws
  (Layer 1 and Milestone 1), conservation along integral curves and first integrals (Layer 2),
  symplectomorphisms and canonical transformations between open subsets (Layer 2), and the
  canonical model in coordinates (Layer 2), whose conventions (`ω = Σ_i dq_i ∧ dp_i`,
  `q̇ = ∂H/∂p`, `ṗ = -∂H/∂q`) are those of #151.
  - Lane A1 of #151 lists flat Hamiltonian mechanics on `Fin (2 * n) → ℝ`: the standard form,
    the Hamiltonian vector field, the coordinate Poisson bracket, a first-integral predicate on
    an open set, Hamilton's equations, the laws of the bracket, and canonical changes of
    variables on open sets. On this roadmap's side, these are the item *Canonical coordinates*
    of Layer 2: a reindexing of the canonical model, with the Hamiltonian vector field and the
    Poisson bracket of Layer 1, proved coordinate equations, and transport to open subsets. A
    first integral of `H` on an open set is a function `F` with `{F, H} = 0` there, for the
    bracket of the restricted form; this roadmap states first integrals through that equation
    and names no separate predicate.
  - Not in this roadmap: statements at finite regularity `C^k` beyond the pointwise ones of
    Layer 1, real-analytic Hamiltonians and first integrals on a domain, and functional
    independence of first integrals with its transport under canonical transformations. They
    can be stated with the Hamiltonian vector field and the Poisson bracket of Layer 1, as
    extensions of this API; this roadmap provides no second Hamiltonian vector field and no
    second Poisson bracket for them.

## References

- J.-M. Souriau, *Structure des systèmes dynamiques*, Maîtrises de mathématiques, Dunod, Paris, 1970.
  - §2 and §6: (2.45), (6.12).
  - §9: (9.12), (9.16), (9.22), (9.24)-(9.26).
  - §11: (11.7), (11.8), (11.12), (11.17), (11.24), (11.27), (11.33).
  - §12: (12.119), (12.131)-(12.136).
  - English translation: *Structure of Dynamical Systems: A Symplectic View of Physics*, translated
    by C. H. Cushman-de Vries, translation edited by R. H. Cushman and G. M. Tuynman, Progress in
    Mathematics 149, Birkhäuser, Boston, 1997,
    [doi:10.1007/978-1-4612-0281-3](https://doi.org/10.1007/978-1-4612-0281-3).
- V. Bargmann, *On unitary ray representations of continuous groups*, Ann. of Math. (2) 59 (1954),
  1-46, [doi:10.2307/1969831](https://doi.org/10.2307/1969831).
- D. McDuff and D. Salamon, *Introduction to Symplectic Topology*, 3rd ed., Oxford Graduate Texts
  in Mathematics 27, Oxford University Press, 2017,
  [doi:10.1093/oso/9780198794899.001.0001](https://doi.org/10.1093/oso/9780198794899.001.0001).
- J. E. Marsden and T. S. Ratiu, *Introduction to Mechanics and Symmetry*, 2nd ed., Texts in
  Applied Mathematics 17, Springer, New York, 1999,
  [doi:10.1007/978-0-387-21792-5](https://doi.org/10.1007/978-0-387-21792-5).
- P. R. Chernoff and J. E. Marsden, *Properties of Infinite Dimensional Hamiltonian Systems*,
  Lecture Notes in Mathematics 425, Springer, Berlin, 1974,
  [doi:10.1007/BFb0073665](https://doi.org/10.1007/BFb0073665).

## Provenance

Part of this material is formalized, in a less general setting, in the physics library
[physlib](https://github.com/leanprover-community/physlib), by the author of this roadmap under the
Apache 2.0 licence:

- `PhyslibAlpha/ClassicalMechanics/MomentMap/Basic.lean`: moment maps of affine infinitesimally
  symplectic actions on a finite-dimensional symplectic vector space, the cocycle and its cyclic
  identity, Noether's theorem, and the translations of the plane;
- `PhyslibAlpha/ClassicalMechanics/MomentMap/Cohomology.lean`: the cohomology class at group level
  for the affine symplectic group;
- `PhyslibAlpha/ClassicalMechanics/MomentMap/GalileanMass.lean`: the Galilean Lie algebra in
  Souriau's parametrization, his cocycle `f₀` (the opposite of the `f₀` of Milestone 3), and the
  total mass;
- `PhyslibAlpha/ClassicalMechanics/MomentMap/GalileanMassCocycle.lean`: the group level of the
  previous file, for the Galilean group acting on `N` free particles: Souriau's cocycle `θ₀` of
  the group, which is not a coboundary and whose derivative at the identity is `f₀`.

These files work in Souriau's sign conventions, not the pinned ones (see the dictionary above).
They are a source to consult, not a specification.
