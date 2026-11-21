# Roadmap: symplectic geometry and Hamiltonian mechanics

**Summary.** This is the root of a family of five roadmaps that together build the geometry of
cotangent phase spaces, Lagrangian submanifolds, symmetry and reduction, moment-map convexity,
completely integrable systems and contact geometry, as a reusable library: canonical
transformations, reduced spaces and torus fibrations carry smooth structures and symplectic forms,
with transport, uniqueness, examples and computational formulas as well as existence theorems. The
five sub-roadmaps are listed below. This root fixes what they share: the class of manifolds, the
sign conventions for cotangent forms, Hamiltonian vector fields, Poisson brackets, fundamental
vector fields and moment maps, the normalization of circles, lattices and measures, and the
boundaries between the family and its neighbours. Every manifold is real, finite-dimensional,
Hausdorff, second countable and without boundary, and a symplectic form is a closed nondegenerate
two-form.

The root also owns one development of its own, the symplectic suspension of a symplectomorphism φ
of a symplectic manifold (M, σ) of dimension 2n: the mapping torus Y_φ, obtained from ℝ × M by
identifying (t + 1, x) with (t, φ(x)), carries the suspension flow, the time form dt and the closed
fibre form ω_v induced by σ, and the product X_φ = (ℝ/ℤ)_s × Y_φ carries the symplectic form
Ω = ds ∧ dt + ω_v. No compactness of M is assumed anywhere.

The headline theorem is the compact horizontal-image theorem. Let J be an almost complex structure
on X_φ of block form: it sends ∂_s to the suspension vector field, preserves the vertical tangent
bundle (the tangent spaces of the fibres of Y_φ over the time circle, pulled back to X_φ), and its
restriction there is tamed by ω_v. Let u be a J-holomorphic embedding of a closed connected Riemann
surface into X_φ whose homology class lies in [S¹_s] × H₁(Y_φ; ℤ). Then the image of u is the torus
S¹_s × γ over a primitive closed orbit γ of the suspension flow, through a periodic point of φ of
least period d, and the Ω-area of u is d. The class condition cannot be dropped: when M is a closed
surface, the copy {s₀} × p⁻¹([t₀]) of M over a point (s₀, [t₀]) is J-holomorphic for suitable J,
has positive ω_v-area and is not of this form.

The layers also prove three results the suspension interface needs. The (n + 1)-st power of Ω is
(n + 1) ds ∧ dt ∧ ω_vⁿ, so the symplectic orientation of X_φ is that of ds, then dt, then the
symplectic orientation of the fibre. For every smooth family of σ-compatible structures on M over a
compact parameter space there is a smooth family of block structures on X_φ compatible with Ω,
agreeing with the given ones near time zero and extending data prescribed on closed faces of the
parameter space and on closed regions of Y_φ; no φ-invariant structure on M is needed. The torus over
the closed orbit of a point of least period d, traversed k times, has Ω-area kd and represents k
times the class of the embedded torus.

These layers build on the Tau Ceti library's smooth mapping tori, symplectic suspensions and
pseudoholomorphic tori, which supply the carriers and the classification of compact curves of zero
vertical area; on HeegaardFloer for families of compatible almost complex structures; on
AlgebraicTopology and DifferentialGeometry for the cross product in singular homology and the
pairing of closed forms with homology classes; and on SmoothBundlesConnections for the kernel
distribution of a submersion. TaubesGromov specializes the suspension to surfaces and DGFloer
coordinates with it. Layer 0 below proves the orientation statement, Layer 1 the families of block
structures and the multiple covers, Layer 2 the horizontal-image theorem.

## How to read the build

The family consists of five sub-roadmaps, each a roadmap in its own right with its own README and
acceptance file, in which every milestone is wanted:

- [Cotangent bundles and Lagrangian geometry](CotangentLagrangian/README.md): Liouville forms,
  cotangent lifts, conormals, generating functions, correspondences, relative neighborhood theorems.
- [Hamiltonian actions and symplectic reduction](HamiltonianReduction/README.md): group-level moment
  maps, global flux and Hamiltonian kernels, coadjoint orbits, free and locally free reduction,
  cotangent reduction and gauge geometry.
- [Convexity, Duistermaat–Heckman and symplectic toric manifolds](ConvexityToric/README.md):
  fixed-point normal forms, Morse–Bott theory, convexity, measure and class variation, Delzant
  classification and orbifold examples.
- [Integrable systems and classical mechanics](IntegrableSystems/README.md): involutive integrals,
  regular Lagrangian fibers, Liouville–Arnold, action-angle variables, Legendre transform and
  central forces.
- [Contact geometry and contact dynamics](ContactGeometry/README.md): contact lines and forms, Reeb
  dynamics, Darboux and Gray stability, symplectization and Legendrian neighborhoods.

The root supplies the conventions below and the ownership boundaries of the family (Scope and
ownership, at the end). Within the family the order is: cotangent, Lagrangian and Hamiltonian
foundations, then reduction. ConvexityToric Layer 1 consumes the compact real root data of
RepresentationTheory/LieGroups Layer 6 for its integral refinement, while ConvexityToric Layers 3
and 4 consume the chamber theory of root systems and HamiltonianReduction R2 and R3.
IntegrableSystems I2.0 provides the positive-period circles before I2 uses angle charts of period
2π. Flux theorems are not inputs of the suspension construction; time-dependent complete
Hamiltonian flows enter the Hamiltonian and common-support applications of the sub-roadmaps where
they are used.

The root's own layers are numbered 0, 1 and 2, the numbers under which other roadmaps cite them as
S0, S1 and S2. Layer 0 is the suspension and its orientation; Layer 1 the seam-compatible block
almost complex structures and the tori over periodic orbits; Layer 2 the compact horizontal-image
theorem. Each layer works with the suspension carriers of the Tau Ceti library, named in its opening
paragraph and listed in the supplier contracts, and states as targets the results those carriers
do not provide. Each *Needs:* line lists the inputs of its statement and of the route given, so that a
target proved by another route is not blocked behind an unrelated input. The Layer 0–2 development
is general symplectic geometry in arbitrary finite dimension, not a four-dimensional gauge-theoretic
or counting result.

## Conventions

1. **Manifolds.** Manifolds are real, finite-dimensional, smooth, Hausdorff, second countable and
   without boundary, unless a result explicitly treats a local model, an orbifold or the smooth
   connection space of gauge theory. Use Mathlib's `ModelWithCorners`, `IsManifold`,
   `TangentSpace`, `mfderiv`, `Diffeomorph` and `Bundle.TotalSpace`, and the continuous dual for
   cotangent fibres. The cotangent bundle is Tau Ceti's `TauCeti.CotangentBundle`, built from the
   continuous-linear-map bundle operations, which give the total space its manifold structure with
   the product model; no private sigma type without charts is used (see the
   [cotangent-bundle Zulip discussion](https://leanprover.zulipchat.com/#narrow/channel/217875-Is.20there.20code.20for.20X.3F/topic/Cotangent.20Bundle.20as.20a.20Manifold/with/560999506)).
2. **Forms.** A two-form is Tau Ceti's `TauCeti.SmoothTwoForm I M`, which is by definition
   `SmoothForm I M ℝ 2` (DifferentialGeometry 0.4), and it is symplectic when
   `TauCeti.SmoothTwoForm.IsSymplectic` holds (closed and fibrewise nondegenerate). Every
   evaluation, pullback and closedness statement uses that one differential-form calculus. A
   smooth map f is symplectic from (M₁, σ₁) to (M₂, σ₂) when `SmoothForm.mpullback f hf σ₂ = σ₁`;
   this equation is written out, not wrapped in a new predicate. The linear notions (Lagrangian,
   isotropic and coisotropic subspaces, symplectic orthogonals, products) are Tau Ceti's
   `TauCeti.SymplecticForm` API.
3. **Cotangent forms.** On T*M the Liouville form is λ_(q,p)(v) = p(dπ(v)) and the canonical form
   is ω = −dλ, which is Σ dqᵢ ∧ dpᵢ in cotangent coordinates (Tau Ceti
   `TauCeti.CotangentBundle.liouvilleForm`, `TauCeti.CotangentBundle.symplecticForm`; on a vector
   space `TauCeti.cotangentLiouvilleForm` and `TauCeti.strongDualCotangentSymplecticForm`, related
   by `TauCeti.neg_extDeriv_cotangentLiouvilleForm`).
4. **Hamiltonian conventions.** The Hamiltonian vector field X_f of f is defined by `ι_(X_f) ω = df`
   (`TauCeti.SmoothTwoForm.IsHamiltonianVectorField`, `TauCeti.SmoothTwoForm.hamiltonianVectorField`);
   a vector field is Hamiltonian when it is the Hamiltonian vector field of some function. The
   Poisson bracket is {f, g} = ω(X_f, X_g) = df(X_g) (`TauCeti.SmoothTwoForm.poissonBracket`,
   `TauCeti.SmoothTwoForm.IsNondegenerate.poissonBracket_eq_mvfderiv`), and then
   `X_{f,g} = −[X_f, X_g]` (`TauCeti.SmoothTwoForm.IsNondegenerate.hamiltonianVectorField_poissonBracket`).
5. **Actions and moment maps.** For a left action of a Lie group G with Lie algebra g, the
   fundamental vector fields satisfy `[ξ,η]_M = −[ξ_M, η_M]` (`TauCeti.fundamentalVectorField`,
   `TauCeti.mlieBracket_fundamentalVectorField`). A moment map μ : M → g* satisfies
   `d⟨μ, ξ⟩ = ι_(ξ_M) ω` (`TauCeti.SmoothTwoForm.IsMomentMap`) and, at group level, is
   coadjoint-equivariant, μ(g x) = Ad*_g μ(x) with (Ad*_g ν)(ξ) = ν(Ad_(g⁻¹) ξ)
   (`TauCeti.SmoothTwoForm.IsEquivariantMomentMap`, `TauCeti.Lie.coadjointRepresentation`). The Lie
   algebra is Mathlib's `GroupLieAlgebra` with Tau Ceti's adjoint maps
   `TauCeti.Lie.adjointContinuousLinearMap`; when the identity is an interior point, statements are
   transported to the left-invariant derivation model through
   `leftInvariantDerivationLieEquivGroupLieAlgebra`, and the two carriers are not identified
   definitionally.
6. **Circles, lattices and measures.** The default circle period is 2π. For a torus with
   exponential map exp, the integral lattice is Λ_ℤ = (2π)⁻¹ ker(exp); integral weights pair
   integrally with Λ_ℤ and into 2πℤ with the period lattice ker(exp). Lebesgue measure on t* is
   normalized so that the weight lattice Λ* dual to Λ_ℤ has covolume 1, and every comparison of
   measures retains these factors. The suspension layers below and HamiltonianReduction R1a.3 use
   circles of period 1 instead: the s-circle and the time circle are `UnitAddCircle`, with time
   form of total integral 1 (`AddCircle.timeForm`), and the angular coordinates are 2πs and 2πt, so
   that dt = (2π)⁻¹ dθ. The positive-period circles `AddCircle p`, their smooth structure, time
   forms and rescalings are those of IntegrableSystems I2.0; the time form of a family of varying
   period is specified there separately from the closed forms of fixed period used here.
7. **The suspension.** In Layers 0–2, (M, σ) is a symplectic manifold of dimension 2n and φ a
   symplectomorphism (a diffeomorphism with `SmoothForm.mpullback φ φ.contMDiff σ = σ`). The
   mapping torus is `Y_φ = (ℝ × M)/((t, x) ∼ (t + 1, φ⁻¹ x))`, Tau Ceti's
   `TauCeti.SmoothMappingTorus φ`: the orbit space of `Multiplicative ℤ` acting by
   k · (t, x) = (t + k, φ⁻ᵏ x) on the type synonym `TauCeti.SmoothMappingTorus.Cover φ` of ℝ × M,
   so that no additive action on ℝ × M is changed. Write [t, x] for the class of (t, x), so
   [t + 1, x] = [t, φ x]; p : Y_φ → ℝ/ℤ, [t, x] ↦ [t] for the projection; T = ∂_t for the
   suspension vector field; dt for the time form; ω_v for the fibre form of σ; and V_Y = ker dp for
   the vertical tangent bundle. On `X_φ = (ℝ/ℤ)_s × Y_φ`, ds, dt and ω_v also denote their pullbacks,
   `Ω = ds ∧ dt + ω_v`, H = span(∂_s, T) is the horizontal plane field and V the pullback of V_Y.
   In coordinates (s, t, x), Ω pairs a∂_s + b∂_t + v with a′∂_s + b′∂_t + v′ to ab′ − a′b + σ(v, v′).
   A *block* almost complex structure J on X_φ satisfies J∂_s = T, hence JT = −∂_s, and preserves V
   (hence also H); its *vertical restriction* is its restriction to V. A *seam-compatible vertical
   family* is a jointly smooth family K_((s,t),x) of complex structures on T_x M, of period 1 in s,
   with the seam identity `K_((s,t+1),x) = dφ_x⁻¹ ∘ K_((s,t),φx) ∘ dφ_x`, that is K_(t+1) = φ*K_t;
   it descends to a block structure on X_φ (`TauCeti.SmoothMappingTorus.suspensionAlmostComplexStructure`).
   For a point x of period d > 0, γ : ℝ/dℤ → Y_φ, [t] ↦ [t, x], is its closed orbit and
   (s, θ) ↦ (s, γ(θ)) its orbit torus. Tori are oriented by ds ∧ dt, a surface with an almost
   complex structure j by the frames (e, je).

## Layer 0: smooth symplectic suspensions

This layer works with Tau Ceti's mapping torus `TauCeti.SmoothMappingTorus φ`, with its manifold structure from Tau Ceti's free properly
discontinuous quotient theorem `TauCeti.instIsManifoldQuotient`, the quotient map
`TauCeti.SmoothMappingTorus.isLocalDiffeomorph_uncurry_mk`, the interval charts
`TauCeti.SmoothMappingTorus.intervalChart`, the projection `TauCeti.SmoothMappingTorus.proj`, the
suspension flow `TauCeti.SmoothMappingTorus.flow`, the field `TauCeti.SmoothMappingTorus.timeVectorField`,
the forms `TauCeti.SmoothMappingTorus.timeForm` and `TauCeti.SmoothMappingTorus.fiberForm`, the
splitting `TauCeti.SmoothMappingTorus.isCompl_span_timeVectorField_ker_mfderiv_proj` and the form
`TauCeti.SmoothMappingTorus.suspensionForm`, symplectic by
`TauCeti.SmoothMappingTorus.isSymplectic_suspensionForm_iff`.

### 0.1 The orientation of a symplectic suspension

Prove that the (2n + 1)-form `dt ∧ ω_vⁿ` on Y_φ vanishes nowhere, and orient Y_φ by it (Tau Ceti
`TauCeti.Manifold.Orientation.ofTopForm`). Prove that for this orientation each fibre inclusion
x ↦ [t, x] carries the symplectic orientation of (M, σ), the orientation of σⁿ, to the orientation
of the fibre cooriented by T: a frame (e₁, …, e₂ₙ) of T_x M is positive for σⁿ exactly when
(T, dι(e₁), …, dι(e₂ₙ)) is positive on Y_φ, where ι is the fibre inclusion. Prove that on X_φ

`Ωⁿ⁺¹ = (n + 1) · ds ∧ dt ∧ ω_vⁿ`,

so that Ω is a volume form and the orientation it defines is the product orientation of the
s-circle, oriented by ds, with Y_φ, oriented by `dt ∧ ω_vⁿ`. For n = 0 the statement reads Ω = ds ∧ dt.

*Route.* ω_v kills T and restricts to σ on each fibre, and T Y_φ = ℝT ⊕ V_Y, so `dt ∧ ω_vⁿ`
evaluated on (T, v₁, …, v₂ₙ) with vᵢ vertical is σⁿ(v₁, …, v₂ₙ) ≠ 0. On X_φ the two-forms ds ∧ dt and
ω_v commute, (ds ∧ dt)² = 0, and ω_vⁿ⁺¹ = 0 because it is pulled back from the (2n + 1)-manifold
Y_φ; the binomial expansion leaves the displayed term.
*Needs:* Tau Ceti `TauCeti.SmoothMappingTorus.timeForm`, `TauCeti.SmoothMappingTorus.fiberForm`,
`TauCeti.SmoothMappingTorus.timeForm_timeVectorField`,
`TauCeti.SmoothMappingTorus.interior_timeVectorField_fiberForm`,
`TauCeti.SmoothMappingTorus.mpullback_mk_fiberForm`,
`TauCeti.SmoothMappingTorus.isCompl_span_timeVectorField_ker_mfderiv_proj`,
`TauCeti.SmoothMappingTorus.ker_bilinFormAt_fiberForm`, `TauCeti.SmoothMappingTorus.suspensionForm`,
the wedge product of smooth forms, `TauCeti.Manifold.Orientation.ofTopForm` and the orientation of
`AddCircle`; DifferentialGeometry 0.4.

**Checks.**
- For M = ℝ² with σ = dx ∧ dy and φ the identity, X_φ = (ℝ/ℤ)² × ℝ² and
  Ω = ds ∧ dt + dx ∧ dy, whose square is 2 ds ∧ dt ∧ dx ∧ dy: the symplectic orientation is that of
  (∂_s, ∂_t, ∂_x, ∂_y). With the opposite order of the circle factors, Ω = dt ∧ ds + ω_v, the
  square would be −2 ds ∧ dt ∧ dx ∧ dy and the symplectic orientation would be opposite to the
  product orientation; the convention Ω(∂_s, ∂_t) = 1 of Convention 7 rules this out.
- For dim M = 0, with M a finite set and φ a permutation of it, Y_φ is a disjoint union of circles,
  one for each cycle of φ, of length the cycle length, ω_v = 0 and Ω = ds ∧ dt: the formula with
  n = 0 is the identity Ω¹ = 1 · ds ∧ dt.

### Examples

- For φ the identity, Y_φ = (ℝ/ℤ) × M, ω_v is σ pulled back along the projection to M, and X_φ is
  the product of the torus (ℝ/ℤ)² with M, with Ω the product form.
- For M = ℝ² with σ = dx ∧ dy and φ the rotation by 2π/3 about the origin, Y_φ is diffeomorphic to
  (ℝ/ℤ) × ℝ², the rotation being isotopic to the identity, but the suspension flow is not the
  product flow: its orbit through [0, 0] closes after time 1 and every other orbit after time 3.
  The form dt ∧ ω_v orients Y_φ, and every fibre inclusion is orientation preserving.

### Dependencies

Tau Ceti: the smooth mapping torus, its quotient manifold structure, flow, time vector field, time
and fibre forms and the tangent splitting; the suspension form and its symplecticity; the time
form and orientation of `AddCircle`; orientations from nowhere-vanishing top forms; the wedge
product. DifferentialGeometry 0.4 (forms in degree two are the generic forms).

## Layer 1: seam-compatible block structures and periodic tori

This layer works with the Tau Ceti carriers for block structures and periodic tori: the covering
map `TauCeti.SmoothMappingTorus.suspensionCover`, which pulls Ω back to ds ∧ dt + σ on
ℝ × ℝ × M; the descended block structure
`TauCeti.SmoothMappingTorus.suspensionAlmostComplexStructure` of a seam-compatible vertical family,
with `Ω(w, Jw) = a² + b² + σ(v, Kv)` for w = a∂_s + b∂_t + v
(`TauCeti.SmoothMappingTorus.eval₂_suspensionForm_suspensionAlmostComplexStructure`), its
Ω-compatibility (`TauCeti.SmoothMappingTorus.compatible_suspensionAlmostComplexStructure`) and the
vertical tameness it inherits (`TauCeti.SmoothMappingTorus.tames_suspensionAlmostComplexStructure`);
the family `TauCeti.SmoothMappingTorus.seamFamily` built from one σ-compatible J₀ by Cayley paths
constant on the collars of width 1/3 about the integers, and its descent
`TauCeti.SmoothMappingTorus.seamAlmostComplexStructure`; the closed orbits
`TauCeti.SmoothMappingTorus.closedOrbit`, the orbit tori `TauCeti.SmoothMappingTorus.orbitTorus`
and `TauCeti.SmoothMappingTorus.periodicTorus`, with their embedding, fibre-intersection, area,
holomorphicity, covering, conjugacy and integer-iterate theorems (supplier contracts).

### 1.1 Families of seam-compatible structures

Let P be a compact finite-dimensional smooth manifold with corners, the parameter space, and let
p ↦ J₀,p be a jointly smooth family of σ-compatible almost complex structures on M. A
seam-compatible vertical family over P is a jointly smooth family K_(p,(s,t),x) such that each
K_(p,·) is a seam-compatible vertical family (Convention 7) of σ-compatible complex structures.
Prove:

- (existence) there is a seam-compatible vertical family over P with K_(p,(s,t),x) = J₀,p(x) for
  |t| ≤ 1/3;
- (relative form) let F ⊂ P be a union of closed faces and A ⊂ Y_φ a closed set, and let K′ be a
  seam-compatible vertical family over P defined on an open neighbourhood W of the set of
  (p, (s, t), x) with p ∈ F or [t, x] ∈ A (the neighbourhood is a union of deck orbits, so that the
  seam identity makes sense on it), equal to J₀,p on the part of W with |t| ≤ 1/3; then there is a
  seam-compatible vertical family over P equal to K′ on a smaller such neighbourhood and to J₀,p for
  |t| ≤ 1/3;
- (descent) the descended structures J_p on X_φ form a jointly smooth family of Ω-compatible block
  structures with J_p ∂_s = T, each with ω_v-tamed vertical restriction;
- (varying φ) for a jointly smooth family p ↦ φ_p of symplectomorphisms of (M, σ), the first two
  statements hold on ℝ × ℝ × M for the seam identities K_(p,t+1) = φ_p*K_(p,t), given J₀,p and, in
  the relative form, face data that satisfy those identities; the descended structures then live
  on the separate suspensions X_(φ_p).

No φ-invariant almost complex structure on M is assumed. Prescribed data are not assumed to
extend unless they satisfy the hypotheses above. For P a point and F, A empty, the existence
statement is `TauCeti.SmoothMappingTorus.seamFamily`.

*Route.* On ℝ × ℝ × M, use HeegaardFloer §4.1 (F2.1): its pointwise homotopies between compatible
structures and their smooth bundlewise assembly on the vertical bundle, with its finite-Cᵏ estimates
and its continuity hypotheses for compact sources, applied with parameters in P; equivalently the
Cayley path (`TauCeti.SymplecticForm.Compatible.cayleyPath`) on each interval [k, k + 1], from
(φᵏ)*J₀,p to (φᵏ⁺¹)*J₀,p, reparametrized to be constant on the collars, as in
`TauCeti.SmoothMappingTorus.seamFamily`. The seam identity on every interval follows from that on
[0, 1] by naturality of the construction under pullback by φ, and holds to every order in t
because it is an identity of smooth families. For the relative form, work on the bundle of
σ-compatible complex structures of the vertical bundle over P × X_φ, whose sections are the
seam-compatible families: the Cayley transform based at a compatible structure identifies each
fibre with a convex set (`TauCeti.SymplecticForm.Compatible.compatibleCayleyEquiv`), the given data
on the collar region and near the prescribed set are locally restrictions of smooth sections, and a
partition of unity extends them.
*Needs:* HeegaardFloer §4.1 (F2.1); Tau Ceti `TauCeti.SmoothMappingTorus.seamFamily`,
`TauCeti.SmoothMappingTorus.suspensionAlmostComplexStructure`,
`TauCeti.SmoothMappingTorus.compatible_suspensionAlmostComplexStructure`,
`TauCeti.SmoothMappingTorus.tames_suspensionAlmostComplexStructure`,
`TauCeti.SymplecticForm.Compatible.cayleyPath`,
`TauCeti.SymplecticForm.Compatible.compatibleCayleyEquiv`, `TauCeti.SmoothTwoForm.Compatible`.

**Checks.**
- For M = ℝ² with σ = dx ∧ dy and φ = diag(2, 1/2), which is symplectic, no σ-compatible J on ℝ²
  is φ-invariant: at the fixed origin, invariance would put φ in the compact group U(J₀), whose
  elements have eigenvalues of modulus one, while φ has eigenvalue 2. Seam-compatible families
  exist nonetheless, which is why the definition asks for K_(t+1) = φ*K_t and not for invariance.
- For P a point and F, A empty, the family is equal to J₀ on |t| ≤ 1/3 and to φ*J₀ on
  |t − 1| ≤ 1/3, as the seam identity requires; a family equal to J₀ near every integer would
  violate the seam identity unless φ preserves J₀.

### 1.2 Multiple covers of periodic tori

Let x be a periodic point of φ of least period d > 0, let k ≥ 1, and let τ_d and τ_(kd) be the
orbit tori through [0, x] of periods d and kd, oriented by ds ∧ dt. Prove that the class of τ_(kd)
in H₂(X_φ; ℤ) is k times the class of τ_d. With Tau Ceti's factorization of τ_(kd) through the
k-fold covering map ℝ/kdℤ → ℝ/dℤ, which is orientation preserving, this gives: τ_(kd) has the
image of the embedded torus τ_d, Ω-area kd, ω_v-area 0, and class k[τ_d]; the torus over a point of
a different φ-orbit has disjoint image. The images of τ_d over the points of one φ-orbit coincide,
and so do their classes.

*Route.* An orientation-preserving k-sheeted covering map between closed connected oriented
surfaces carries the fundamental class to k times the fundamental class: the transfer carries the
fundamental class of the base to that of the cover, and composing with the projection multiplies by
k. Push forward along τ_d.
*Needs:* Tau Ceti `TauCeti.SmoothMappingTorus.orbitTorus_comp_prodMap_coverMap`,
`TauCeti.SmoothMappingTorus.integral_periodicTorus_suspensionForm`,
`TauCeti.SmoothMappingTorus.mpullback_orbitTorus_mpullback_snd_fiberForm`,
`TauCeti.SmoothMappingTorus.range_closedOrbit_apply`, `AddCircle.coverMap`,
`TauCeti.HomologicalOrientation.fundamentalClass`, `TauCeti.HomologicalOrientation.mapFundamentalClass`;
AlgebraicTopology §5.3 (finite covers and transfer: `p_* ∘ transfer = d · id` for a cover with
fibres of d points) and §6.3 (homological orientations and fundamental classes).

**Checks.**
- For M a point and φ the identity, X_φ is the torus (ℝ/ℤ)², d = 1, τ_1 is the identity and τ_k is
  the k-fold cover in the t-direction: its class is k times the fundamental class and its Ω-area
  is k. A statement giving τ_k the class of its image, the fundamental class, fails.
- For M = ℝ² and φ the rotation by 2π/3 about the origin, a point x ≠ 0 has least period 3, its
  torus τ_3 has Ω-area 3 and meets the fibre over [0] in x, φx and φ²x, while the torus over the
  origin has Ω-area 1.

### Examples

- For φ the identity and any σ-compatible J₀, the constant family K = J₀ is seam-compatible, and
  its block structure is the product of the standard structure of (ℝ/ℤ)² with J₀; every point of M
  has least period 1 and its torus is (ℝ/ℤ)² × {x}, of Ω-area 1.
- For a symplectomorphism of finite order m, averaging a compatible structure over the group
  generated by φ gives a φ-invariant J₀, and the constant family K = J₀ is seam-compatible; the
  existence statement of 1.1 needs no such average.

### Dependencies

HeegaardFloer §4.1 (F2.1). Tau Ceti: the suspension covering map, the block structures descended
from seam-compatible families and from Cayley-path families, their compatibility and tameness;
closed orbits, orbit and periodic tori, their areas, holomorphicity, covers, conjugacies and
iterates; fundamental classes. AlgebraicTopology §5.3 and §6.3. Layer 0.

## Layer 2: the compact horizontal-image theorem

This layer works with the Tau Ceti carriers for horizontal and vertical directions and vertical
area: `TauCeti.SmoothMappingTorus.suspensionHorizontalSubspace`,
`TauCeti.SmoothMappingTorus.suspensionVerticalSubspace`, the pointwise identity
`(u*ω_v)(e, je) = ω_v((du e)_V, J(du e)_V) ≥ 0` for pseudoholomorphic maps with equality exactly
for horizontal du e
(`TauCeti.SmoothMappingTorus.eval₂_mpullback_mpullback_snd_fiberForm_apply_eq_zero_iff`), the
vanishing criterion for the vertical area
(`TauCeti.SmoothMappingTorus.integralTopForm_mpullback_mpullback_snd_fiberForm_eq_zero_iff`), and
the classification of compact connected immersed pseudoholomorphic curves of zero vertical area,
`TauCeti.SmoothMappingTorus.range_eq_range_orbitTorus_of_integralTopForm_eq_zero`, with its
factorization through the orbit torus
`TauCeti.SmoothMappingTorus.exists_isLocalDiffeomorph_orbitTorus_comp_eq_of_mfderiv_mem_suspensionHorizontalSubspace`.

### 2.1 The vertical distribution

Prove that the projection p : Y_φ → ℝ/ℤ is a submersion (`Manifold.IsSubmersion`), so that its
kernel distribution V_Y = ker dp is a smooth distribution of rank 2n
(`TauCeti.IsContMDiffDistribution`), the kernel distribution of SmoothBundlesConnections B1.0
(`Manifold.IsSubmersion.isContMDiffDistribution_ker_mfderiv`). Prove that its pullback to X_φ
under the product tangent identification is `TauCeti.SmoothMappingTorus.suspensionVerticalSubspace`,
a smooth distribution of rank 2n, and that the horizontal planes
`TauCeti.SmoothMappingTorus.suspensionHorizontalSubspace` form a smooth distribution of rank 2,
spanned by the smooth vector fields ∂_s and T, complementary to it.
*Needs:* SmoothBundlesConnections B1.0; Tau Ceti `TauCeti.SmoothMappingTorus.contMDiff_proj`,
`TauCeti.SmoothMappingTorus.mfderiv_proj_timeVectorField`,
`TauCeti.SmoothMappingTorus.contMDiff_timeVectorField`,
`TauCeti.SmoothMappingTorus.suspensionHorizontalSubspace_eq_span`,
`TauCeti.SmoothMappingTorus.isCompl_suspensionVerticalSubspace_suspensionHorizontalSubspace`,
`Manifold.IsSubmersion.isContMDiffDistribution_ker_mfderiv`, `TauCeti.IsContMDiffDistribution`;
Mathlib `Manifold.IsSubmersion`.

**Checks.**
- For φ the identity, Y_φ = (ℝ/ℤ) × M and V_Y is the tangent bundle of the M factor; on X_φ the
  vertical distribution is 0 ⊕ 0 ⊕ TM and the horizontal one is T(ℝ/ℤ)² ⊕ 0.
- On X_φ the vertical distribution has rank 2n and the horizontal one rank 2, adding up to
  dim X_φ = 2n + 2. Taking for V the kernel on X_φ of the differential of (s, [t, x]) ↦ [t], which
  contains ∂_s, would give rank 2n + 1 and a space meeting H in the line of ∂_s, not a complement.

### 2.2 The cross summand and the vertical area

Let [S¹_s] ∈ H₁(ℝ/ℤ; ℤ) be the fundamental class of the s-circle, oriented by ds, and pr_Y : X_φ → Y_φ
the projection. Prove:

- (Künneth) the map c ↦ [S¹_s] × c, H₁(Y_φ; ℤ) → H₂(X_φ; ℤ), given by the homology cross product,
  is injective, and its image, the cross summand [S¹_s] × H₁(Y_φ; ℤ), is the kernel of
  (pr_Y)_* : H₂(X_φ; ℤ) → H₂(Y_φ; ℤ); more precisely H₂(X_φ; ℤ) is the direct sum of
  [pt] × H₂(Y_φ; ℤ), mapped isomorphically by (pr_Y)_*, and the cross summand;
- (vanishing) for a closed oriented surface C and a smooth map f : C → X_φ whose class f_*[C] lies
  in the cross summand, equivalently (pr_Y ∘ f)_*[C] = 0, the vertical area
  `∫_C f*(pr_Y* ω_v)` is zero.

*Route.* The homology of the circle is free, so the Tor terms of the Künneth sequence vanish and the
cross product is an isomorphism onto H₂(X_φ; ℤ) from H₀ ⊗ H₂ ⊕ H₁ ⊗ H₁. The projection carries
[pt] × b to b, and [S¹_s] × c to the cross product of the image of [S¹_s] in H₁ of a point, which is
zero, with c. For the vanishing, ω_v is closed because σ is, and pr_Y* ω_v is pulled back from
Y_φ; the integral of the closed form ω_v over the surface pr_Y ∘ f is its pairing with
(pr_Y ∘ f)_*[C] under the de Rham homomorphism, and that class is zero.
*Needs:* Tau Ceti `TopCat.singularHomologyCross`, `TopCat.singularHomologyKunnethShortComplex_shortExact`,
`TauCeti.HomologicalOrientation.mapFundamentalClass`, `TauCeti.SmoothMappingTorus.isClosed_fiberForm_iff`,
`TauCeti.integralTopForm`; AlgebraicTopology §5.1 (Eilenberg–Zilber and Künneth);
DifferentialGeometry §8.4 (chain integration, Stokes and the de Rham homomorphism) and §8.5 (the de
Rham theorem).

**Checks.**
- For φ the identity on the torus M = (ℝ/ℤ)² with σ = dx ∧ dy, X_φ is the four-torus with
  coordinates (s, t, x, y), H₂(X_φ; ℤ) ≅ ℤ⁶ with basis the coordinate two-tori, and the cross
  summand is spanned by the st-, sx- and sy-tori, which is the kernel of the map to
  H₂(Y_φ; ℤ) ≅ ℤ³ forgetting s. A reading of the cross summand as all of H₂(X_φ; ℤ) would include the
  xy-torus, on which ω_v integrates to 1.
- In the same example the horizontal torus (s, t) ↦ (s, [t, x₀]) has class [S¹_s] × [S¹_t] in the
  cross summand and vertical area 0, as the vanishing statement says.

### 2.3 The compact horizontal-image theorem

Prove `exists_range_eq_range_orbitTorus_of_mapFundamentalClass_eq_zero`. Let (M, σ) be a symplectic
manifold of dimension 2n and φ a symplectomorphism. Let J be a block almost complex structure on
X_φ whose vertical restriction is tamed by ω_v: ω_v(v, Jv) > 0 for every nonzero vertical v. It may
be one of the structures of Layer 1 or any other structure with these properties. Let C be a closed
connected Riemann surface, with almost complex structure j, and let u : C → X_φ be a smooth
embedding with du ∘ j = J ∘ du. Suppose that the class of u(C) lies in the cross summand
[S¹_s] × H₁(Y_φ; ℤ); by 2.2 this is the condition (pr_Y ∘ u)_*[C] = 0 in H₂(Y_φ; ℤ), which does
not depend on the orientation of C used for [C] and is the form in which the acceptance file states
it. Then there is a point x of M, periodic for φ with least period d > 0, such that u(C) is the
image (ℝ/ℤ)_s × γ of the orbit torus through [0, x], where γ is the primitive closed orbit of the
suspension flow through [0, x].

Prove also the image parametrization: u = τ ∘ v for the orbit torus τ of period d and a
diffeomorphism v : C → (ℝ/ℤ) × (ℝ/dℤ) that is holomorphic for j and the standard structure
`TauCeti.SmoothAlmostComplexStructure.addCircleProd 1 d`, hence orientation preserving for the
orientation of C by j and the orientation ds ∧ dt; consequently `∫_C u*Ω = d` and `∫_C u*ω_v = 0`
for the orientation of C by j. A zero Ω-area is not part of the conclusion.

The theorem uses compactness of the one closed source and of its image, including completeness of
the restricted tangent flows; it assumes no compactness of M, and it makes no uniform statement,
such as a bound on images or a no-escape property, for a family of different curves. It classifies
embedded images: constant maps, nonembedded maps and parametrized multiple covers (1.2) are
different objects and are not classified here.

*Route.* By 2.2 the vertical area of u is zero; the Tau Ceti classification of curves of zero
vertical area, applied with the orientation of C by j, gives the image. In detail: the pointwise
identity makes the density of u*ω_v nonnegative, so it vanishes and every tangent image of u is the
horizontal plane H; the mapping-torus component of u is then tangent to T, so u(C) lies in one leaf
(ℝ/ℤ) × γ; it is closed because u is an immersion of a compact surface; and u lifts through the
orbit torus to a surjective local diffeomorphism v, injective because u is.
*Needs:* 2.1, 2.2; Tau Ceti
`TauCeti.SmoothMappingTorus.range_eq_range_orbitTorus_of_integralTopForm_eq_zero`,
`TauCeti.SmoothMappingTorus.exists_isLocalDiffeomorph_orbitTorus_comp_eq_of_mfderiv_mem_suspensionHorizontalSubspace`,
`TauCeti.SmoothMappingTorus.isPseudoholomorphic_periodicTorus_suspensionAlmostComplexStructure`,
`TauCeti.SmoothMappingTorus.integral_periodicTorus_suspensionForm`,
`TauCeti.SmoothMappingTorus.orbitTorus`, `TauCeti.IsPseudoholomorphicAt`,
`TauCeti.SmoothAlmostComplexStructure`, `TauCeti.HomologicalOrientation`,
`TauCeti.Manifold.Orientation`; Mathlib `Manifold.IsSmoothEmbedding`, `Function.minimalPeriod`.

**Checks.**
- For φ the identity on M = (ℝ/ℤ)² with σ = dx ∧ dy and the constant standard structure J₀ = J_std,
  the fibre torus (x, y) ↦ (s₀, [t₀, (x, y)]) is a J-holomorphic embedding with vertical area 1, and
  its class [pt] × [M] is not in the cross summand; its image is not of the form (ℝ/ℤ) × γ. The
  homological hypothesis cannot be dropped.
- For φ the rotation by 2π/3 of ℝ² and J descended from a seam-compatible family, the horizontal
  torus through a point x ≠ 0 has image (ℝ/ℤ) × γ with γ of least period 3 and Ω-area 3; a
  conclusion assigning every image Ω-area 1 fails. Through the origin the image has Ω-area 1.
- For φ the identity on M = ℝ², each image is (ℝ/ℤ)² × {x}, of Ω-area 1.

### Examples

- For φ the identity on a closed symplectic surface (M, σ) and J the product of the standard
  structure of (ℝ/ℤ)² with a compatible J₀, the embedded J-holomorphic curves whose class lies in
  the cross summand are exactly the tori (ℝ/ℤ)² × {x}. The fibres {s₀} × p⁻¹([t₀]), copies of M, are
  J-holomorphic embeddings of positive vertical area whose classes are not in the cross summand.
- For a symplectomorphism φ of finite order m with a fixed point x₀ and a point x₁ of least period
  m, the tori through [0, x₀] and [0, x₁] are, for every block J, embedded J-holomorphic curves with
  classes in the cross summand, of Ω-areas 1 and m.

### Dependencies

Layers 0 and 1. SmoothBundlesConnections B1.0 (kernel distributions of submersions).
AlgebraicTopology §5.1 (Künneth). DifferentialGeometry §8.4 and §8.5 (de Rham homomorphism and
theorem). Tau Ceti: horizontal and vertical subspaces of the suspension, vertical-area identities and
the classification of curves of zero vertical area; fundamental classes, the homology cross product
and the Künneth sequence. Mathlib: smooth embeddings, submersions and minimal periods.

## Downstream consumers

- The five sub-roadmaps of the family use the conventions above, which they cite as the family
  conventions.
- TaubesGromov cites Layers 0–2 as SymplecticGeometry S0–S2 and instantiates them for an
  area-preserving diffeomorphism of a closed surface in its separate four-dimensional application;
  its Seiberg–Witten and Gromov counts, signs and zeta functions are its own.
- DGFloer coordinates its general suspension contracts with Layers 0–2, cited as S0–S2.
- MathematicalBilliards follows the convention ω = −dλ of Convention 3.
- GeometricQuantization consumes CotangentLagrangian C1, HamiltonianReduction R1–R3 and
  ConvexityToric's Duistermaat–Heckman measure; it defines no moment map or Liouville measure of its
  own.
- DifferentialGeometry and ComplexKahlerGeometry record the family as a consumer of their forms,
  flows and de Rham theory, and of the degree-one parity obstruction of ComplexKahlerGeometry §6.3.

## Scope and ownership

**This root owns** the conventions of the family and the targets of Layers 0–2: the orientation of a
symplectic suspension (0.1), parametrized and relative families of seam-compatible structures
(1.1), the classes of multiple covers of periodic tori (1.2), the vertical distribution (2.1), the
cross summand and the vanishing of vertical area (2.2), and the compact horizontal-image theorem
in its homological form with its image parametrization (2.3). Layers 0–2 are the general smooth
suspension interface of the family: the mapping torus, its seam-compatible block structures, the
tori over periodic orbits and the horizontal-image theorem, in arbitrary finite dimension.

**The sub-roadmaps own** their own content: CotangentLagrangian, HamiltonianReduction,
ConvexityToric, IntegrableSystems and ContactGeometry, as listed under How to read the build.
In particular: CotangentLagrangian C2.1 owns the matrix compatibility identities, the
identification of the three pairwise intersections of the real symplectic, complex-linear and
orthogonal groups with realified U(n), the direct maximal-compactness theorems for GL(n, ℂ) and
Sp(2n, ℝ) by trace growth, the connectedness of these two groups and the preservation of the
symplectic group under polar decomposition; it then instantiates the matrix-model theorem of
RepresentationTheory/LieGroups Layer 9 with H = C_ℝ or Sp_ℝ and π = id, and the comparisons with
the semisimple, finite-centre, Killing-form and adjoint models are separate from those direct
proofs and not premises of them. The generic subgroup theorems are those of the consuming
LieGroups layers. CotangentLagrangian C2.0 is the ambient real and complex polar-decomposition
package. ContactGeometry CG1 builds the contact line and the line-valued Levi form on Tau Ceti's
contact predicate, independently of cotangent applications; CotangentLagrangian C2.2 uses that
predicate for its two signed cosphere forms, ContactGeometry CG5 consumes the cosphere application,
and the contact Darboux, Gray and neighbourhood refinements are CG3–CG5. ContactGeometry CG6 offers the
geometric boundary and sign adapters to HeegaardFloer and DGFloer, whose analytic and invariant
endpoints remain theirs. CotangentLagrangian C4 builds the relative Poincaré refinements on
DifferentialGeometry's homotopy operator.

**The Tau Ceti library provides** the Hamiltonian calculus the family uses: Hamiltonian vector
fields and the Poisson bracket with its conventions, symplectic vector fields, conservation of
energy along integral curves, Hamiltonian flows, infinitesimal actions, fundamental vector fields,
moment maps and group-level equivariant moment maps (Conventions 4 and 5 and the supplier
contracts). It also provides most of the suspension development cited by other roadmaps as S0–S2;
the targets of S0–S2 that it discharges resolve as follows, and Layers 0–2 above state the rest.

| S0–S2 target | Tau Ceti declaration |
|---|---|
| S0: the mapping torus as the orbit space of `Multiplicative ℤ` on a type synonym of ℝ × M, its action instances, smooth structure, Hausdorffness and second countability | `TauCeti.SmoothMappingTorus`, `TauCeti.SmoothMappingTorus.Cover` with `Cover.instContMDiffConstSMul`, `Cover.instIsCancelSMul`, `Cover.instProperlyDiscontinuousSMul`, through `TauCeti.instIsManifoldQuotient` |
| S0: the quotient map as a local diffeomorphism; interval charts with integer-shift transitions φ⁻ᵏ | `TauCeti.SmoothMappingTorus.isLocalDiffeomorph_uncurry_mk`, `TauCeti.SmoothMappingTorus.intervalChart`, `TauCeti.SmoothMappingTorus.intervalChart_mk_of_add_intCast_mem` |
| S0: the base circle as `AddCircle 1`, the projection, the fibre inclusions and change of lift | `TauCeti.SmoothMappingTorus.proj`, `TauCeti.SmoothMappingTorus.range_mk`, `TauCeti.SmoothMappingTorus.mk_add_intCast`, with `UnitAddCircle` and `AddCircle.timeForm` |
| S0: the time form dt, the fibre form ω_v and its kernel ℝT, the suspension flow and its time-one map, the splitting ℝT ⊕ V | `TauCeti.SmoothMappingTorus.timeForm`, `TauCeti.SmoothMappingTorus.fiberForm`, `TauCeti.SmoothMappingTorus.ker_bilinFormAt_fiberForm`, `TauCeti.SmoothMappingTorus.flow`, `TauCeti.SmoothMappingTorus.flow_one_mk`, `TauCeti.SmoothMappingTorus.isCompl_span_timeVectorField_ker_mfderiv_proj` |
| S0: Ω = ds ∧ dt + ω_v is closed and nondegenerate | `TauCeti.SmoothMappingTorus.suspensionForm`, `TauCeti.SmoothMappingTorus.isSymplectic_suspensionForm_iff` |
| S1: the block structure upstairs, J̃² = −1, `Ω̃(w, J̃w) = a² + b² + ω(v, Jv)`, invariance under the deck transformations, descent and compatibility | `TauCeti.SmoothMappingTorus.suspensionCover`, `TauCeti.SmoothMappingTorus.suspensionAlmostComplexStructure`, `TauCeti.SmoothMappingTorus.eval₂_suspensionForm_suspensionAlmostComplexStructure`, `TauCeti.SmoothMappingTorus.compatible_suspensionAlmostComplexStructure`, `TauCeti.SmoothMappingTorus.tames_suspensionAlmostComplexStructure` |
| S1: a collar-constant path from J₀ to φ*J₀ extended by the seam rule, without a φ-invariant J₀ | `TauCeti.SmoothMappingTorus.seamFamily`, `TauCeti.SmoothMappingTorus.mfderiv_symm_seamFamily`, `TauCeti.SmoothMappingTorus.seamAlmostComplexStructure` |
| S1: the closed orbit γ of a periodic point, embedded exactly for the least period, its d intersections with a fibre, independence of the starting point | `TauCeti.SmoothMappingTorus.closedOrbit`, `TauCeti.SmoothMappingTorus.isSmoothEmbedding_closedOrbit_iff`, `TauCeti.SmoothMappingTorus.ncard_mk_preimage_range_closedOrbit`, `TauCeti.SmoothMappingTorus.range_closedOrbit_apply` |
| S1: the block-holomorphic torus (s, t) ↦ (s, [t, x]) with Ω-area d and ω_v-area 0 | `TauCeti.SmoothMappingTorus.orbitTorus`, `TauCeti.SmoothMappingTorus.periodicTorus`, `TauCeti.SmoothMappingTorus.isPseudoholomorphic_periodicTorus_suspensionAlmostComplexStructure`, `TauCeti.SmoothMappingTorus.integral_periodicTorus_suspensionForm`, `TauCeti.SmoothMappingTorus.mpullback_orbitTorus_mpullback_snd_fiberForm` |
| S1: multiple covers, change of fibre, conjugacy and integer-iterate laws | `TauCeti.SmoothMappingTorus.closedOrbit_coverMap`, `TauCeti.SmoothMappingTorus.orbitTorus_comp_prodMap_coverMap`, `TauCeti.SmoothMappingTorus.map_closedOrbit`, `TauCeti.SmoothMappingTorus.congr`, `TauCeti.SmoothMappingTorus.iterateMap_closedOrbit_coe` |
| S2: the vertical energy density, its vanishing exactly on horizontal vectors, and the horizontal tangent planes of a curve of zero vertical area | `TauCeti.SmoothMappingTorus.eval₂_mpullback_mpullback_snd_fiberForm_apply_eq_zero_iff`, `TauCeti.SmoothMappingTorus.integralTopForm_mpullback_mpullback_snd_fiberForm_eq_zero_iff`, `TauCeti.SmoothMappingTorus.range_mfderiv_eq_suspensionHorizontalSubspace` |
| S2: a compact connected immersed curve with horizontal tangent planes is (ℝ/ℤ) × γ for a primitive closed orbit | `TauCeti.SmoothMappingTorus.range_eq_range_orbitTorus_of_integralTopForm_eq_zero`, `TauCeti.SmoothMappingTorus.exists_isLocalDiffeomorph_orbitTorus_comp_eq_of_mfderiv_mem_suspensionHorizontalSubspace` |

**Owned elsewhere and consumed by the family.**

- MorseTheory Layers 1–5 (M1–M5) own ordinary Morse and abstract Morse–Bott normal forms,
  compact-band deformation and negative-disc attachment; ConvexityToric Layer 2 owns their
  Hamiltonian specialization and equivariant perfection.
- HeegaardFloer §4.1 (F2.1) owns the ordinary Darboux and Moser theorems, the symplectic and
  almost-complex base, the shared contraction inverse and generic-form transport, smooth-family
  primitive selection, time-dependent pullback and families of compatible structures. The family owns relative and
  equivariant refinements and applications, with precise compactness and complete-flow hypotheses,
  and does not duplicate the linear symplectic groups, symplectic orthogonals or compatible
  structures of the Tau Ceti library.
- DifferentialGeometry owns forms, the Cartan and homotopy formulas, de Rham theory, integration,
  smooth and time-dependent flows and Frobenius. Tubular neighbourhoods are GeometricTopology §1.5.
- SmoothBundlesConnections owns bundle operations, principal and associated bundles (Layers 1–2),
  connections (Layer 3), curvature and gauge (Layer 4), holonomy (Layer 5), the first Chern class of
  circle bundles (B6.2), the affine action on connections (B3.1), slices with finite isotropy for
  proper locally free actions (B1.4), measures from smooth densities including the Liouville
  measure (B2.4), and regular fibres and kernel distributions of submersions (B1.0).
  HamiltonianReduction R5 owns Sobolev gauge spaces and analytic Coulomb slices; cotangent forms
  and symplectic reduction remain in the family.
- RepresentationTheory/LieGroups owns Lie groups, exponentials, the adjoint representation, maximal
  tori with their existence, conjugacy and exhaustion, the geometric Weyl group and the compact real
  root data of Layer 6. RepresentationTheory/RootSystems owns the abstract chamber combinatorics
  of root systems; the closed-chamber fundamental domain of the Weyl group, with uniqueness on the
  walls, is Tau Ceti's `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`, which RootSystems
  consumes. HamiltonianReduction R2 applies these to the chambers and centralizers of compact
  connected coadjoint orbits, separately from its homogeneous coadjoint manifolds of arbitrary
  groups; ConvexityToric Layer 1 adds only the integral period, character and isogeny
  normalization of the real data, and ConvexityToric Layer 3 consumes the chamber quotient of R2.
- HamiltonianReduction R3 constructs the possibly ineffective Hamiltonian level presentation and
  its symplectic form, and singular reduction, using the slices of SmoothBundlesConnections B1.4.
  Orbifolds O1–O5, with the thin and torus comparison O4-T, own the generic proper étale,
  invariant-form and Morita, represented-bundle, classifying, coarse and de Rham, character-class
  and weighted-integration interfaces, which do not consume ConvexityToric's integration; Orbifolds
  O7 makes the comparisons with both constructions. ConvexityToric Layer 4 consumes them on the
  model of R3 and owns the effective and ineffective reduced classes, volumes and
  Duistermaat–Heckman applications.
- HamiltonianReduction R5 owns surface Sobolev and elliptic gauge theory, consuming the scalar
  elliptic estimates of PDE Layers 4–5, the compact-bundle Sobolev scale and Laplace-type estimates
  of ComplexKahlerGeometry §5.4 and §5.7 (K5a), and the smooth gauge and holonomy of
  SmoothBundlesConnections; R5 owns the rough Sobolev-coefficient and slice extension and its
  surface quotient and stratum applications.
- The Seiberg–Witten and Gromov counts, signs and zeta functions of surface suspensions are
  TaubesGromov's. Factorization of arbitrary pseudoholomorphic maps through simple ones belongs to
  the analysis of pseudoholomorphic curves and is not a target here.

## Exact supplier contracts

These are the suppliers of the conventions and of Layers 0–2; each sub-roadmap lists its own.

### From Mathlib

- `ModelWithCorners`, `IsManifold`, `TangentSpace`, `mfderiv`, `Diffeomorph` (notation
  `M ≃ₘ⟮I, I⟯ M`), `Bundle.TotalSpace`, `ContinuousLinearMap` and `StrongDual` for cotangent fibres.
- `GroupLieAlgebra`, `LieGroup`.
- `AddCircle`, `UnitAddCircle`, `AddCircle.coverMap`, `Multiplicative`, `MulAction.orbitRel.Quotient`,
  `ProperlyDiscontinuousSMul`, `properlyDiscontinuousSMul_iff_properSMul`.
- `Manifold.IsSmoothEmbedding` (a topological embedding that is a `C^n` immersion),
  `Manifold.IsSubmersion`, `Function.IsPeriodicPt`, `Function.minimalPeriod`,
  `Function.isPeriodicPt_minimalPeriod`.
- `TopCat`, `ModuleCat` and the singular homology functor through which Tau Ceti's fundamental
  classes are stated.

### From Tau Ceti

All declarations below are at the pinned Tau Ceti and are written with their full names, except
in the two bullets that name their namespace; paths are under `TauCeti/`.

- *Forms and symplectic linear algebra*: `TauCeti.SmoothTwoForm` (`SmoothForm I M ℝ 2`,
  `Geometry/Manifold/TwoForm/Basic.lean`), `TauCeti.SmoothForm.mpullback`,
  `TauCeti.SmoothBundleForm.eval₂`, the wedge product (`Geometry/Manifold/DifferentialForm/Wedge/`),
  `TauCeti.SmoothTwoForm.IsNondegenerate`, `TauCeti.SmoothTwoForm.IsSymplectic`,
  `TauCeti.SmoothTwoForm.Tames`, `TauCeti.SmoothTwoForm.Compatible`
  (`Geometry/Symplectic/Manifold/TwoForm.lean`); `TauCeti.SymplecticForm.IsLagrangian` and the
  linear Lagrangian, orthogonal and product API (`Geometry/Symplectic/Lagrangian/Basic.lean`);
  `TauCeti.SymplecticForm.Compatible.cayleyPath` (`Geometry/Symplectic/Cayley/Smooth.lean`).
- *Cotangent forms*: `TauCeti.CotangentBundle`, `TauCeti.CotangentBundle.liouvilleForm`,
  `TauCeti.CotangentBundle.symplecticForm` (ω = −dλ,
  `TauCeti.CotangentBundle.symplecticForm_eq_neg_mextDeriv`),
  `TauCeti.CotangentBundle.isSymplectic_symplecticForm`
  (`Geometry/Symplectic/Cotangent/Bundle/Liouville.lean`); `TauCeti.cotangentLiouvilleForm`,
  `TauCeti.strongDualCotangentSymplecticForm`, `TauCeti.neg_extDeriv_cotangentLiouvilleForm`
  (`Geometry/Symplectic/Cotangent/`).
- *Hamiltonian calculus* (`Geometry/Symplectic/Hamiltonian/`), in `TauCeti.SmoothTwoForm`:
  `IsHamiltonianVectorField` (`σ(X x, v) = df_x(v)`), `hamiltonianVectorField` (`(σ♭)⁻¹ df`, the
  unique Hamiltonian vector field of a nondegenerate form in finite dimension,
  `IsNondegenerate.isHamiltonianVectorField_iff_eq`), `poissonBracket` (`σ(X_f, X_g)`) with
  `IsNondegenerate.poissonBracket_eq_mvfderiv`, `IsNondegenerate.hamiltonianVectorField_poissonBracket`
  (closed nondegenerate form, `C²` functions), `IsHamiltonianVectorField.apply_eq_of_isMIntegralCurve`
  (conservation of energy), `symplecticVectorFields`, `IsMomentMap` and `IsEquivariantMomentMap`
  (`EquivariantMomentMap/Basic.lean`); with `TauCeti.InfinitesimalAction` and the Hamiltonian
  flows of `Geometry/Symplectic/Hamiltonian/Flow.lean`.
- *Lie groups*: `TauCeti.fundamentalVectorField` and `TauCeti.mlieBracket_fundamentalVectorField`
  (`[ξ_M, η_M] = −⁅ξ, η⁆_M` for a `C²` left action, `Geometry/Lie/FundamentalVectorField.lean`);
  `TauCeti.Lie.adjointContinuousLinearMap`, `TauCeti.Lie.coadjointRepresentation`
  (`(Ad*_g ν)(X) = ν(Ad_(g⁻¹) X)`); `leftInvariantDerivationLieEquivGroupLieAlgebra`
  (`Geometry/Lie/Tangent/LieEquiv.lean`); the maximal flows of manifolds
  (`Geometry/Manifold/Flow/`); `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`
  (`LinearAlgebra/RootSystem/FundamentalDomain.lean`).
- *Quotients and circles*: `TauCeti.instIsManifoldQuotient` and `TauCeti.isLocalDiffeomorph_quotientMk` (a free,
  properly discontinuous action by smooth maps on a Hausdorff locally compact manifold,
  `Geometry/Manifold/Instances/Quotient.lean`); the manifold `AddCircle p` with
  `AddCircle.isLocalDiffeomorph_coe`, its orientation (`Geometry/Manifold/Orientation/AddCircle.lean`)
  and `AddCircle.timeForm` with `AddCircle.pathIntegral_timeForm_coe` (integral b − a along
  [a, b]) and `AddCircle.mpullback_diffeomorphAddCircle_timeForm` (rescaling of periods).
- *Orientation and integration*: `TauCeti.Manifold.Orientation`,
  `TauCeti.Manifold.Orientation.ofTopForm` (`Geometry/Manifold/Orientation/TopForm.lean`),
  `TauCeti.integralTopForm` (`Geometry/Manifold/DifferentialForm/Integration/TopForm.lean`).
- *Distributions*: `TauCeti.IsContMDiffDistribution` (`Geometry/Manifold/Distribution.lean`),
  `Manifold.IsSubmersion.isContMDiffDistribution_ker_mfderiv`
  (`Geometry/Manifold/Distribution/Submersion.lean`; a submersion's kernel distribution is smooth
  of rank `dim X − dim N`).
- *Almost complex structures*: `TauCeti.SmoothAlmostComplexStructure`,
  `TauCeti.SmoothAlmostComplexStructure.addCircleProd`, `TauCeti.IsPseudoholomorphicAt`
  (`Geometry/Symplectic/Manifold/JHolomorphic.lean`), `TauCeti.Manifold.tangentSpaceProdEquiv`.
- *Mapping tori* (`Geometry/Manifold/Instances/MappingTorus.lean` and the files below it,
  `Geometry/Manifold/VectorField/MappingTorus*`, `Geometry/Manifold/DifferentialForm/MappingTorus*`),
  in `TauCeti.SmoothMappingTorus`: the declarations of the S0 and S1 rows of the table above, and
  `contMDiff_proj`, `contMDiff_timeVectorField`, `timeForm_timeVectorField`,
  `mfderiv_proj_timeVectorField`, `interior_timeVectorField_fiberForm`, `mpullback_mk_fiberForm`,
  `isClosed_fiberForm_iff` (ω_v is closed exactly when σ is), `range_closedOrbit_apply`.
- *Symplectic suspensions* (`Geometry/Symplectic/Manifold/Suspension/`), in
  `TauCeti.SmoothMappingTorus`: the declarations of the S1 and S2 rows of the table above, and
  `suspensionHorizontalSubspace`, `suspensionVerticalSubspace`,
  `suspensionHorizontalSubspace_eq_span`,
  `isCompl_suspensionVerticalSubspace_suspensionHorizontalSubspace`. The classification
  `range_eq_range_orbitTorus_of_integralTopForm_eq_zero` assumes `M` locally compact Hausdorff,
  `I` boundaryless with `E` finite-dimensional, `C` compact, connected and boundaryless of
  dimension two with an orientation for which the frames (e, je) are positive, `u` smooth,
  pseudoholomorphic, with injective differential, `J` of block form and vertically tamed along the
  image of `u`, and zero vertical area; it concludes that `range u` is the image of the orbit torus
  of the least period of the fibre coordinate of any value of `u`.
- *Homology*: `TauCeti.HomologicalOrientation`, `TauCeti.HomologicalOrientation.fundamentalClass`,
  `TauCeti.HomologicalOrientation.mapFundamentalClass`
  (`AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean`; spaces in `Type`, integral
  coefficients), `IsCoveringMap.singularTransfer` (`AlgebraicTopology/Singular/Transfer/Basic.lean`);
  `TopCat.singularHomologyCross`
  (`AlgebraicTopology/Singular/CrossProduct.lean`) and
  `TopCat.singularHomologyKunnethShortComplex_shortExact`
  (`AlgebraicTopology/Singular/Kunneth/Sequence.lean`).

### From TauCetiRoadmap.HeegaardFloer

§4.1 (F2.1), symplectic and almost-complex foundations: pointwise homotopies between tame and
compatible structures, their smooth bundlewise assembly with finite-Cᵏ estimates, the shared
contraction inverse, smooth-family primitive selection and time-dependent pullback. Layer 1 (1.1)
consumes the families of compatible structures.

### From TauCetiRoadmap.SmoothBundlesConnections

B1.0: the kernel distribution of a submersion, a smooth distribution of rank dim X − dim N with the
smooth vector bundle structure of its fibres (2.1). The family also consumes B1.4 and B2.4 as
listed under Scope and ownership.

### From TauCetiRoadmap.AlgebraicTopology

§5.1 (Eilenberg–Zilber and Künneth), on Tau Ceti's homology cross product, for the computation of
H₂(X_φ; ℤ) in 2.2; §5.3 (finite covers and transfer) and §6.3 (homological orientations and
fundamental classes) for 1.2.

### From TauCetiRoadmap.DifferentialGeometry

0.4 (bundled forms; degree-two scalar forms are `SmoothForm I M ℝ 2`); 1.4 and 5.4 (Cartan and
homotopy formulas); 3.5 (time-dependent flows); §8.4 (chain integration, Stokes and the de Rham
homomorphism) and §8.5 (the de Rham theorem), for the pairing of ω_v with homology classes in 2.2.

## References

- Ana Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
  §§2–8, 18, 22–30: cotangent forms, neighborhood theory, integrable systems, reduction and toric/DH
  geometry.
- Jerrold Marsden and Tudor Ratiu, *Introduction to Mechanics and Symmetry*, second edition:
  cotangent reduction, momentum maps, mechanics and semidirect product examples.
- Victor Guillemin and Shlomo Sternberg, *Symplectic Techniques in Physics*: convexity, reduction
  and mechanics.
- V. I. Arnold, *Mathematical Methods of Classical Mechanics*: Liouville–Arnold and central forces.
