# Roadmap: Hamiltonian actions and symplectic reduction

**Summary.** This roadmap builds the geometry of Lie group symmetries of symplectic manifolds and of
their quotients. Its objects are smooth actions of finite-dimensional Lie groups `G` on symplectic
manifolds `(M, ω)` by symplectomorphisms; their moment maps `μ : M → 𝔤*`, with `d⟨μ, ξ⟩ = ι_(ξ_M) ω` and
`μ(g x) = Ad*_g μ(x)`; the groups of symplectic and of Hamiltonian diffeomorphisms and the flux
homomorphism between them; the coadjoint orbits of `G` with their Kirillov–Kostant–Souriau forms; and
the reduced spaces `μ⁻¹(c) / G_c`. Manifolds and Lie groups are finite-dimensional, Hausdorff, second
countable and boundaryless, except for the orbifold presentations of locally free levels and the space
of connections over a surface in the last layer.

The headline theorems are these.

- *Regular reduction* (Marsden–Weinstein–Meyer). If `μ` is an equivariant moment map, `c` a regular
  value, and the stabilizer `G_c` of `c` acts freely and properly on `Z = μ⁻¹(c)`, then `Z / G_c` is a
  manifold of dimension `dim M − dim G − dim G_c` with a unique symplectic form whose pullback to `Z` is
  the restriction of `ω`. Reduction at `c` is reduction at zero of `M × O_c⁻`, the product with the
  coadjoint orbit of `c` carrying the negated KKS form, and reduction by a closed
  normal subgroup can be done in stages when each stage is regular, free and proper.
- *The flux theorem.* For a closed connected symplectic manifold, a path of symplectomorphisms from the
  identity has zero flux in `H¹_dR(M)` exactly when it is homotopic with fixed ends to a Hamiltonian
  isotopy, and `1 → Ham → Symp₀ → H¹_dR(M) / Γ_ω → 0` is exact, the induced bijection
  `Symp₀ / Ham → H¹_dR(M) / Γ_ω` being a homeomorphism for the quotient topologies; here `Γ_ω` is the
  flux group of loops. For `(ℝ/ℤ)²` with `ω = A dx ∧ dy`, `Γ_ω = A · H¹(T²; ℤ)`. A compactly supported
  form holds on noncompact manifolds.
- *Coadjoint orbits.* Every coadjoint orbit `G / G_ν` is a symplectic manifold with
  `ω_ν(ξ_O, η_O) = ν([ξ, η])`, and its orbit map into `𝔤*` is an equivariant moment map. If `K` is compact
  and connected, every coadjoint orbit meets a closed Weyl chamber `𝔷* × 𝔱*_(ss,+)` in exactly one point,
  every coadjoint stabilizer `K_ν` is connected, and for a regular element `X` of a maximal torus the
  height function `p ↦ ⟨p, X⟩` on the orbit `O_μ` (through an invariant inner product) is a Morse
  function with even indices, so that `χ(O_μ) = |W / W_μ|` for the Weyl group `W` and the stabilizer
  `W_μ` of `μ`.
- *The local normal form.* For a proper Hamiltonian action of any Lie
  group, a neighbourhood of an orbit `G p` is equivariantly symplectomorphic to a neighbourhood of the
  zero orbit in `G ×_(G_p) (𝔪* × V)`, with moment map `Ad*_g(ν + η + μ_V(v))`. Here `ν = μ(p)`, `𝔪` is an
  invariant complement of the Lie algebra of `G_p` in that of `G_ν`, `V` is the symplectic normal space
  of the orbit, and `μ_V` is the quadratic moment map of `G_p` on `V`.

Tau Ceti's library supplies the starting point: Hamiltonian vector fields, moment maps and their
equivariance defect, cotangent lifts, de Rham cohomology and the descent of forms.
SmoothBundlesConnections supplies homogeneous spaces, free proper quotients, slices and connections;
LieGroups the conjugacy of maximal tori and the real root data of compact groups; LieGroupoidsPoisson
the Lie–Poisson conventions, the cotangent groupoid and its isotropy quotients, with which this
roadmap compares the KKS form and ordinary reduction. ConvexityToric consumes the chamber and the
orbifold reduced spaces.

## How to read the build

Layer 1 adds to Tau Ceti's moment-map theory its group-level statements: stabilizers and orbit maps,
restriction to subgroups, disconnected groups, and the model actions. Layer 1a integrates the
infinitesimal flux sequence along paths of symplectomorphisms and proves the flux theorems, compact and
compactly supported; it uses no other layer. Layer 2 builds coadjoint orbits and their KKS forms for an
arbitrary Lie group, and the chamber classification and connected centralizers for compact connected
groups. Layer 2a does the Morse theory of height functions on compact coadjoint orbits. Layer 3 proves
regular reduction, the shifting construction and reduction in stages (§§3.0–3.0c), quotients by
discrete groups (§3.0d), the orbifold presentation of locally free levels (§3.0e), the local normal
form (§3.1) and singular reduction (§3.2). Layer 4 treats cotangent reduction and compares groupoid
reduction with Layer 3. Layer 5 builds the gauge-theoretic moment map on the space of connections over
a closed surface and the local structure of the moduli of flat connections. Each *Needs:* line lists
the inputs of its statement and route, so that a target proved another way is not blocked behind an
unrelated section. Every result cited from another roadmap or from the library is used with its own
hypotheses; a headline theorem of another roadmap is not a substitute for the interface cited. Every
quotient test among the targets and Examples (§3.0c, §3.0e, §4.1, §5.10) verifies the pulled-back or
descended form, not only the dimension or a bijection of sets.

Other roadmaps cite the former numbering of this roadmap, in blocks R1–R5, which maps as follows. R1
is Layer 1; R1a is Layer 1a and R1a.k is §1a.k; R2 is Layer 2; item k of R2a, also written R2a.k, is
§2a.k; R3 is Layer 3, its text before R3.1 is §§3.0–3.0e, and R3.1 and R3.2 are §3.1 and §3.2; R4 is
Layer 4; and R5 is Layer 5.

## Conventions

1. **Signs** (those of the family [SymplecticGeometry](../README.md), and of Tau Ceti). The canonical
   cotangent form is `ω = −dλ` with `λ_(q,p)(v) = p(dπ v)`, so `ω = Σ dqᵢ ∧ dpᵢ`. A Hamiltonian vector field
   satisfies `ι_(X_f) ω = df` (Tau Ceti's `SmoothTwoForm.IsHamiltonianVectorField`), the Poisson bracket is
   `{f, g} = df(X_g)` (`SmoothTwoForm.poissonBracket`), and `X_({f,g}) = −[X_f, X_g]`. The fundamental
   vector field of a left action is `ξ_M(x) = d_1(g ↦ g · x)(ξ)` (`TauCeti.fundamentalVectorField`), and
   `[ξ, η]_M = −[ξ_M, η_M]`. A moment map satisfies `d⟨μ, ξ⟩ = ι_(ξ_M) ω`; the coadjoint action is
   `Ad*_g ν = ν ∘ Ad_(g⁻¹)` (`Lie.coadjointRepresentation`). Cannas da Silva and Bates–Lerman use
   these conventions; Meinrenken writes the generating vector field as `−ξ_M`, so his moment-map
   equation `d⟨Φ, ξ⟩ = −ι(ξ_M) ω` is the same condition. The default circle period is `2π`; §1a.3
   uses period-1 coordinates and converts.
2. **Manifolds, groups and actions.** Manifolds and Lie groups are real, smooth, finite-dimensional,
   Hausdorff, second countable and without boundary, except for the space of connections of Layer 5 and
   the orbifold presentations of §3.0e. Connectedness and compactness are assumed only where stated. A
   *smooth symplectic action* is a `MulAction G M` with `ContMDiffSMul` such that every `g` satisfies
   `g* ω = ω` (`SmoothForm.mpullback (g • ·) ω = ω`), the hypotheses of Tau Ceti's equivariant moment map
   theorems. An infinitesimal moment map (`SmoothTwoForm.IsMomentMap`) carries no equivariance; a
   group-level moment map (`SmoothTwoForm.IsEquivariantMomentMap`) adds coadjoint equivariance as a
   separate condition. Moment maps take values in the algebraic dual `Module.Dual ℝ 𝔤`, which is the
   continuous dual `StrongDual ℝ 𝔤` in finite dimension (`LinearMap.toContinuousLinearMap`); a result
   that needs a normed target, such as the regular level of §3.0a, reads `μ` there.
3. **Forms.** A two-form is Tau Ceti's `SmoothTwoForm I M`, which is by definition the generic smooth
   form `SmoothForm I M ℝ 2` of DifferentialGeometry §0.4; symplectic means `SmoothTwoForm.IsSymplectic`,
   closed and fibrewise nondegenerate. There is a single form carrier, and every evaluation, pullback and
   closedness statement is about it.
4. **Principal actions.** A left action `g • x` is converted to the principal right action
   `x · g = g⁻¹ • x`, as in SmoothBundlesConnections §B1.4.
5. **Orbits.** The coadjoint orbit of a noncompact group carries the homogeneous manifold structure of
   §2.1; its map into `𝔤*` is an injective immersion and is not assumed to be an embedding or to have
   closed image.
6. **Infinite dimension.** The theorems of Layer 5 have their own Fréchet and Sobolev hypotheses; no
   finite-dimensional reduction theorem of Layer 3 is applied to them unchanged.
7. **Names.** The statable headline theorems are declared in `Suggested.lean` in the namespace
   `TauCetiRoadmap.HamiltonianReduction`; other targets are stated in prose. A backticked name is a
   declaration of Tau Ceti, of Mathlib or of `Suggested.lean`, except a carrier attributed in the same
   sentence to the roadmap that proposes it, such as ComplexKahlerGeometry's `BundleSobolev E s`.

<a id="r1-smooth-actions-moment-maps-and-equivariance"></a>

## Layer 1: smooth actions, moment maps and equivariance

Tau Ceti already proves the general theory this layer rests on. It has fundamental vector fields
of a smooth left action and their bracket identity. It has infinitesimal and coadjoint-equivariant
moment maps, with their restriction along Lie algebra homomorphisms, products, negation, shifts,
transport and uniqueness. It has the equivariance defect with its cocycle law, its derivative and its
integration over connected groups, the cotangent lift and its moment map, and the exact sequence of
symplectic vector fields. The supplier contracts list these declarations. This layer adds the
group-level statements Tau Ceti lacks: stabilizers and orbit maps, restriction to Lie subgroups, the
component condition for disconnected groups, and the model actions at group level.

### 1.1 Stabilizers, orbits and the orbit map

Let a Lie group `G` act smoothly on the left on a manifold `M` modelled by `I'` (Conventions 2), with
fundamental vector fields `ξ_M = TauCeti.fundamentalVectorField I' ξ` and infinitesimal action
`InfinitesimalAction.fundamental`. For `x ∈ M` the stabilizer `G_x = MulAction.stabilizer G x` is
closed, hence an embedded Lie subgroup by Tau Ceti's closed-subgroup theorem. Prove that its Lie
algebra, transported to `𝔤` through Tau Ceti's `leftInvariantDerivationLieEquivGroupLieAlgebra`, is
the isotropy algebra `(InfinitesimalAction.fundamental I G I' M).isotropy x`, the kernel of
`ξ ↦ ξ_M(x)`. The orbit map `g ↦ g · x` has derivative `ξ ↦ ξ_M(x)` at the identity by definition;
prove that it has constant rank, equal at every `g` to the dimension of the orbit tangent space
`(InfinitesimalAction.fundamental I G I' M).orbitTangent x`, so `dim 𝔤_x + dim(𝔤 · x) = dim 𝔤` is the rank–nullity
statement of Tau Ceti's `finrank_orbitTangent_add_finrank_isotropy` read at the group level
(Cannas da Silva, §23.2, item 1, p. 142, and the proof of Theorem 23.4, p. 143).

*Needs:* Tau Ceti `fundamentalVectorField`, `mfderiv_smul_fundamentalVectorField`,
`InfinitesimalAction.isotropy`, `InfinitesimalAction.orbitTangent`,
`finrank_orbitTangent_add_finrank_isotropy`, `Lie.isEmbeddedLieSubgroup_of_isClosed`,
`Lie.lieSubalgebraOfSubgroup`, `Lie.mem_lieSubalgebraOfSubgroup`,
`isMIntegralCurve_mulInvariantExp_smul_smul`; Mathlib `MulAction.stabilizer`.

**Checks.**
- The circle `ℝ/2πℤ` acting on `S² ⊂ ℝ³` by rotation about the `z`-axis: at the poles the stabilizer is
  the whole circle, its Lie algebra is `ℝ`, the isotropy algebra is `ℝ` and the orbit map has rank 0;
  at every other point the stabilizer is trivial and the orbit map has rank 1. The global variant
  `{ξ | ξ_M = 0 on all of M}`, the Lie algebra of the kernel of the action, is `0` here and misses the
  isotropy at the poles.
- For `SO(3)` acting on `S²` every orbit map has rank 2, while for `SO(3)` acting on `ℝ³` the orbit map
  of the origin has rank 0: the rank is constant along each orbit, not on `M`.

### 1.2 Restriction to subgroups, transport and disconnected groups

Throughout, `ω` is symplectic, the action is a smooth symplectic action (Conventions 2) and
`μ : M → 𝔤*` is a group-level moment map, Tau Ceti's `SmoothTwoForm.IsEquivariantMomentMap`
(Cannas da Silva, Definition 22.1, pp. 133–134). Restriction along a Lie group homomorphism and the
equivalence of group and infinitesimal equivariance for connected `G` are Meinrenken, Remarks 7.13 (c)
and (d), p. 84.

- *Restriction.* For a Lie subgroup `ι : H → G`, an injective immersive homomorphism of Lie groups,
  embedded or not, with Lie algebra inclusion `dι : 𝔥 → 𝔤`,
  prove that `(dι)* ∘ μ` is a group-level moment map of the restricted action. The infinitesimal part
  is Tau Ceti's `SmoothTwoForm.IsMomentMap.comp`; the target is the comparison of the fundamental
  fields of `H` with those of `G` along `dι` and the equivariance under `H`.
- *Transport.* For a `G`-equivariant symplectomorphism `φ : (M', ω') → (M, ω)`, prove that `μ ∘ φ` is a
  group-level moment map for `ω'`, from Tau Ceti's `SmoothTwoForm.IsMomentMap.mpullback` and the
  equivariance of `φ`.
- *Connected groups on any manifold.* Tau Ceti's
  `IsMomentMap.isEquivariantMomentMap_of_momentCocycle_eq_zero` integrates infinitesimal equivariance
  for a connected group acting on a connected manifold. Prove it for a connected `G` and an arbitrary
  `M`: a moment map whose cocycle vanishes at every point is coadjoint-equivariant, because a connected
  group maps each connected component of `M` to itself, so the theorem applies component by component.
- *Disconnected groups.* For a group with several components
  prove the component criterion: if `M` is connected, `μ` is a moment map whose cocycle vanishes, and
  `μ(g_i · x₀) = Ad*_(g_i) μ(x₀)` at one point `x₀` for one element `g_i` of each connected component of
  `G`, then `μ` is coadjoint-equivariant. The route: the defect `θ` of Tau Ceti's `momentDefect` is independent of `x`,
  satisfies `θ(gk) = θ(g) + Ad*_g θ(k)` and has derivative the cocycle at the identity, so it is locally
  constant on `G`, and it vanishes at the chosen representatives.

*Needs:* §1.1; Tau Ceti `SmoothTwoForm.IsMomentMap`, `SmoothTwoForm.IsEquivariantMomentMap`,
`IsMomentMap.comp`, `IsMomentMap.mpullback`, `momentDefect`, `IsMomentMap.momentDefect_eq`,
`IsMomentMap.momentDefect_mul_eq`, `IsMomentMap.mvfderiv_momentDefect_one`,
`IsMomentMap.isEquivariantMomentMap_of_momentCocycle_eq_zero`, `Lie.coadjointRepresentation`.

**Checks.**
- `O(2)` acting on `T*S¹ = S¹ × ℝ` by the cotangent lift of its action on the circle, with
  `μ(θ, p) = p`: the rotation subgroup fixes `p`, and a reflection sends `(θ, p)` to `(−θ, −p)` and acts
  on `𝔰𝔬(2)*` by `−1`, so `μ` is equivariant. The shift `μ + c` with `c ≠ 0` has the same vanishing
  cocycle and is equivariant under the identity component, but under a reflection
  `(μ + c)(r · x) = −p + c ≠ −p − c = Ad*_r((μ + c)(x))`: infinitesimal equivariance alone does not give
  equivariance for a disconnected group, and the component criterion is exactly what fails. It also
  matches Tau Ceti's `IsEquivariantMomentMap.add_const_iff`: `c` is not invariant under `Ad*_r = −1`.
- For a connected `G` the criterion needs only the identity element, and it reduces to Tau Ceti's
  `isEquivariantMomentMap_of_momentCocycle_eq_zero`.

### 1.3 The model actions at group level

Tau Ceti proves the infinitesimal moment maps of these actions; this section states their
group-level forms (Cannas da Silva, §22.4, pp. 137–138, for translations along a Lagrangian subspace
and angular momentum; Meinrenken, Propositions 7.18 and 7.20, pp. 87–88, for invariant one-forms such
as the Liouville form and for the linear symplectic group).

- *Translations.* For a finite-dimensional symplectic vector space `(V, ω)`, the additive group `V`
  acting on itself by translation has the moment map `μ(x)(Z) = ω(Z, x)` (Tau Ceti's
  `SymplecticForm.translationMomentMap` with `τ = id`). Prove that its equivariance defect is the
  homomorphism `θ(v)(Z) = ω(Z, v)`, that its derivative at zero is the Heisenberg cocycle
  `c(ξ, η) = ω(ξ, η)` of Tau Ceti's `SymplecticForm.momentCocycle_translation`, and that `μ + ν` is
  equivariant for no constant `ν` unless `ω = 0`.
- *The linear symplectic group.* For `Sp(V, ω)` acting linearly, prove that `μ_A(v) = ½ ω(A v, v)`, Tau
  Ceti's `SymplecticForm.linearMomentMap`, is coadjoint-equivariant at group level:
  `μ(g v)(A) = μ(v)(g⁻¹ A g)` because `g` preserves `ω`.
- *Lifted rotations.* For `SO(n)` acting on `ℝⁿ` and its cotangent lift to `T*ℝⁿ = ℝⁿ × (ℝⁿ)*`, the
  moment map is `⟨μ(q, p), ξ⟩ = p(ξ q)`; prove that it is the restriction of Tau Ceti's
  `TauCeti.cotangentMomentMap` along `𝔰𝔬(n) → 𝔤𝔩(n)` and agrees with Tau Ceti's
  `CotangentBundle.momentMap` for the manifold `ℝⁿ`. For `n = 3`, under `ξ ↦ (v ↦ ξ × v)` it is the
  angular momentum `q × p`.
- *The general cotangent lift.* For a smooth action of `G` on `Q`, the cotangent lift preserves the
  Liouville form and `μ(q, p)(ξ) = p(ξ_Q(q))` is an equivariant moment map: these are Tau Ceti's
  `CotangentBundle.mpullback_smul_liouvilleForm` and `CotangentBundle.isEquivariantMomentMap_momentMap`.

*Needs:* §1.2; Tau Ceti `SymplecticForm.translationMomentMap`,
`SymplecticForm.momentCocycle_translation`, `SymplecticForm.linearMomentMap`,
`TauCeti.cotangentMomentMap`, `CotangentBundle.momentMap`,
`CotangentBundle.isEquivariantMomentMap_momentMap`, `momentDefect`;
Tau Ceti's embedded Lie subgroup `Sp(V, ω)` (`TauCeti/Geometry/Lie/Subgroup/Symplectic.lean`).

**Checks.**
- For `V = ℝ²` with `ω = dx ∧ dy` and `Z = ∂_x`, `Z' = ∂_y`: `c(∂_x, ∂_y) = ω(∂_x, ∂_y) = 1 ≠ 0`, so the
  translation action has no equivariant moment map, while its restriction to the line `ℝ ∂_x` has one,
  `c` vanishing on a line.
- For `n = 3`, `p(ξ × q) = ξ · (q × p)` by the scalar triple product, so the lifted rotation moment map
  is `q × p`; the opposite pairing `q(ξ p)` would give `p × q`, the negative, which fails
  `d⟨μ, ξ⟩ = ι_(ξ_M) ω` with `ω = Σ dqᵢ ∧ dpᵢ`.

### Examples

- The circle acting on `ℂ` by `e^(it) · z`, with `ω = (i/2) dz ∧ dz̄ = dx ∧ dy`: the moment map is
  `μ(z) = −½ |z|²` up to an invariant constant, the stabilizer of `0` is the circle and every other
  stabilizer is trivial (§1.1).
- `O(2)` on `T*S¹` (§1.2's Check) is the smallest example where the component criterion is needed.

### Dependencies

Tau Ceti: fundamental vector fields and infinitesimal actions with isotropy and orbit tangent
spaces, the closed-subgroup theorem and Lie algebras of subgroups, infinitesimal and group-level
moment maps with their defect and cocycle, the translation, linear and cotangent moment maps.
Mathlib: `MulAction.stabilizer`, `GroupLieAlgebra`.

## Layer 1a: global flux, the Hamiltonian kernel and the endpoint quotient

This layer integrates the infinitesimal flux sequence along paths of symplectomorphisms. That
sequence, `0 → H⁰_dR(M) → C^∞(M) → {X | L_X ω = 0} → H¹_dR(M) → 0` with `f ↦ −X_f` and `X ↦ [ι_X ω]`, is
Tau Ceti's, for a closed nondegenerate form on a finite-dimensional manifold
(`SmoothTwoForm.IsNondegenerate.exact_negHamiltonianₗ_interiorClass`,
`SmoothTwoForm.IsNondegenerate.interiorClass_surjective`,
`SmoothTwoForm.IsNondegenerate.ker_negHamiltonianₗ`). The layer is independent of Layers 2 to 5. Its
order is: the path calculus of §1a.0, which does not assume compactness; the compact endpoint theory of §1a.1 and §1a.2; the torus computation of §1a.3; and the
common-compact-support theory of §1a.4, which reuses the path calculus with its own selector,
completeness and topology inputs. Throughout, `TauCeti.Diffeotopy` is Tau Ceti's carrier of smooth
isotopies, `Diffeomorph.applyMulAction` the evaluation action of the diffeomorphism group, and
`Diffeomorph.fixingSubgroup` the subgroup fixing a set pointwise. On a compact Hausdorff manifold
modelled on a locally compact space, the topological-group facts `Diffeomorph.continuous_trans`,
`Diffeomorph.continuous_symm`, `Diffeomorph.isTopologicalGroup` and
`Diffeomorph.isClosed_fixingSubgroup` are consumed with their `IsManifold` hypotheses; on a
noncompact manifold §1a.4 builds the topology it needs from `ContMDiffMap.manifoldWeakWhitneyTopology`.

### 1a.0 Smooth symplectic paths and flux

*The raw path calculus.* On any finite-dimensional symplectic manifold `(M, ω)`, compact or not,
consider jointly smooth symplectic diffeotopies `φ_t` and two-parameter families `φ_(u,t)`, constant
on prescribed collars of the ends of the time interval. For these, construct the Eulerian velocity
field `X_t = (∂_t φ_t) ∘ φ_t⁻¹`, prove that the contraction `α_t = ι_(X_t) ω` is a closed one-form
depending jointly smoothly on `t`, and prove the product, inverse and pullback identities below and
the two-parameter identity. Prove that integration over a compact parameter interval commutes with
pullback and with the exterior derivative under compact bounds on the parameter domain and on the
supports. This algebra assumes no compactness of `M`. Compactness enters only in §1a.1 to §1a.3, where
it makes the inverse fields complete and the period coordinates finite-dimensional; in §1a.4 the
common compact support, the relative periods and the complete support flows play that role. The
ordered-flow correction of §1a.1 uses only these inputs and the fact that an isotopy acts trivially
on the ordinary or compactly supported cohomology in question. The path calculus is proved before
either endpoint theory.

*The symplectomorphism group.* Let `(M, ω)` be a nonempty, closed (compact, boundaryless) and
connected symplectic manifold. Define `Symp(M, ω)` as the subgroup of Tau Ceti's smooth
diffeomorphism group cut out by `φ*ω = ω`, with the compact-open `C^∞` topology, and prove that it is
a closed topological subgroup, using continuity of the first-jet pullback test `φ ↦ φ*ω` at each
point.

*Flux.* A smooth symplectic path is a smooth symplectic diffeotopy `φ_t`, `t ∈ [0, 1]`, with
`φ_0 = id`, constant on collars of both time ends. Its velocity field `X_t` and the closed one-forms
`α_t = ι_(X_t) ω` are jointly smooth (proved from the diffeotopy and pullback calculus). Define

`Flux(φ) = [∫₀¹ α_t dt] ∈ H¹_dR(M)`

in Tau Ceti's `deRhamCohomology I M 1`, and prove that it also equals `[∫₀¹ φ_t* α_t dt]`. The route
specializes the time-dependent pullback derivative and the Cartan formula: for a smooth
time-dependent symplectic field `Y_t` with flow `Ψ_t`, `∂_t (Ψ_t* ω) = Ψ_t* (L_(Y_t) ω) = 0` on the
actual flow domain; the common-support constructions of §1a.4 use this specialization. For every
smooth integral one-cycle `γ`, prove that `⟨Flux(φ), γ⟩` is the integral of `ω` over the swept
two-chain `(t, s) ↦ φ_t(γ(s))`, oriented by `dt` followed by the orientation of the cycle. Flux as a
homomorphism on path classes, its homotopy invariance and this swept-chain formula are Banyaga,
Proposition II.1.1 with its proof and Remarque II.1.2, pp. 181–183.

*Path classes and the flux homomorphism.* Define the group of smooth symplectic paths modulo smooth
homotopy fixing both time ends, with compatible collars. Its product is the pointwise product
`(φψ)_t = φ_t ∘ ψ_t`, its inverse `φ_t⁻¹`. Prove the velocity identity `X_(φψ) = X_φ + (φ_t)_* X_ψ`,
and from it, using that an isotopy acts trivially on `H¹_dR(M)`, that `Flux` is a homomorphism on path
classes. Keep these operations distinct from temporal concatenation and reversal: construct smooth
collared concatenation and time reversal separately and prove their endpoint-fixed path-class laws
and flux laws. In Tau Ceti's diffeotopy API, `Diffeotopy.trans Φ Ψ` has slices `Ψ_t ∘ Φ_t` and
`Diffeotopy.symm Φ` has slices `Φ_t⁻¹`, so the pointwise product `φψ` above is represented by
`Diffeotopy.trans ψ φ`. Tau Ceti's diffeotopies carry no collar data, so collar-constant paths are a
separately specified subtype. Prove collar-fixed relative smoothing and compatibility with
reparametrization for every construction.

*Homotopy invariance.* For a two-parameter family `φ = φ_(u,t)` put `X = (∂_t φ) ∘ φ⁻¹`,
`Y = (∂_u φ) ∘ φ⁻¹`, `β_t = φ* ι_X ω` and `β_u = φ* ι_Y ω`, and prove

`∂_u β_t − ∂_t β_u = d_M (ω(X, Y) ∘ φ)`.

Integrating over the parameter square proves that `Flux` is invariant under endpoint-fixed smooth
homotopy, with the actual end conditions. Prove naturality of `Flux` under symplectomorphisms and
products, including the orientation and normalization of the cycle pairings.

*Needs:* Tau Ceti `SmoothTwoForm.interiorClass`, `TauCeti.deRhamCohomology`, `TauCeti.Diffeotopy`,
`Diffeotopy.trans`, `Diffeotopy.symm`, `Diffeomorph.weakWhitneyTopology`, `Diffeomorph.isTopologicalGroup`,
`SmoothTwoForm.IsSymplectic`, `TauCeti.mlieDerivForm_eq_interior_mextDeriv_add` (Cartan's formula);
DifferentialGeometry §1.4 (Cartan calculus), §3.5 (time-dependent flows and two-time flows), §5.4
(homotopy operator) and §§8.3–8.4 (integration over smooth chains); HeegaardFloer §4.1 (F2.1)
(time-dependent form-pullback differentiation).

**Checks.**
- On `(ℝ/ℤ)²` with `ω = A dx ∧ dy`, the translation path `φ_t(x, y) = (x + t a, y + t b)` has `X = a ∂_x + b ∂_y`
  and `α_t = ι_X ω = A (a dy − b dx)` for every `t`, so `Flux(φ) = A (a [dy] − b [dx])`. Contracting in the
  second slot, `ω(·, X)`, gives the negative class.
- On `ℝ²` with `ω = dx ∧ dy`, the family `φ_(u,t)(x, y) = (x + t, y + u x)` is symplectic (its Jacobian has
  determinant 1), with `X = ∂_x`, `Y = (x' − t) ∂_y` at the point `(x', y')`, `ω(X, Y) ∘ φ = x`,
  `β_t = φ* dy = dy + u dx` and `β_u = −x dx`. Then `∂_u β_t − ∂_t β_u = dx = d_M(ω(X, Y) ∘ φ)`; the opposite
  sign would give `−dx`.

### 1a.1 Smooth primitive selection and the Hamiltonian path kernel

This section uses the symplectic contraction, primitive and Moser calculus of HeegaardFloer §4.1
(F2.1) in its stated scope. The degree-one primitive operator below is constructed here by fixed-path and
radial integration; it needs neither a second good cover nor a degree-two loss estimate read as a
degree-one theorem. It supplies arbitrary smooth finite-dimensional parameter families, including
faces and collars, both for the compact kernel argument and for the componentwise compact part of
§1a.4. Throughout, `M` is compact.

*Period coordinates.* Construct a finite smooth period-dual basis `θ_i` of `H¹_dR(M)`, closed one-forms
dual to a basis of smooth integral one-cycles, and the continuous linear class-coordinate map on
closed one-forms, using de Rham integration over smooth one-cycles and the real universal
coefficient theorem.

*The primitive selector.* A compact manifold has finitely many connected components `M_j`; fix a base
point `x_(0,j)` in each. For an exact one-form `α` define `f_(0,j)(x) = ∫_(x_(0,j) → x) α` along any
path in `M_j`; exactness gives path independence. On a finite coordinate cover, represent `f_(0,j)`
by a fixed piecewise smooth path to a chart centre followed by radial coordinate segments, and
differentiate these local integral formulas to prove `d f_(0,j) = α` and joint smoothness in every
smooth finite-dimensional parameter family, including charts at corners and faces of the parameter
domain. Set

`S_j α = f_(0,j) − (∫_(M_j) f_(0,j) ωⁿ) / (∫_(M_j) ωⁿ)`,

and let `S α` be the function equal to `S_j α` on `M_j`. Prove that `S` is linear and that `S α` is the
unique primitive of `α` with mean zero on every component. For a fixed auxiliary Riemannian metric
put `D = max_j diam(M_j)`; then `osc(f_(0,j)) ≤ D ‖α‖_(C⁰)`, and with `d f_(0,j) = α` finite-chart
derivative comparisons give `‖S α‖_(C^(k+1)) ≤ C_k ‖α‖_(C^k)`. Prove the same bounds after each
parameter derivative by differentiating the fixed integration formulas and the mean. Hence `S` is
continuous linear on the space of exact one-forms and smooth in finite-dimensional parameters, and
by uniqueness its restrictions to prescribed parameter faces carrying the same componentwise
normalization agree. Invert `ω` on the `θ_i` to vector fields `Y_i` with `ι_(Y_i) ω = θ_i`; Cartan's
formula gives `L_(Y_i) ω = 0`, and compactness makes the flows complete. The period coordinates, the
operator `S` and the ordered-flow formulas below are exported maps with their evaluation,
restriction and estimate laws.

*The kernel theorem.* For a smooth symplectic path `φ_t` write `[α_t] = Σ_i a_i(t) [θ_i]`, put
`A_i(t) = ∫₀ᵗ a_i(v) dv`, and let `ψ_t` be the composite, in a fixed order, of the complete
symplectic flows of the `Y_i` for the times `A_i(t)`. Prove `[ι_(X_ψ,t) ω] = [α_t]`, using that every
intervening isotopy acts trivially on cohomology. Hence `h_t = ψ_t⁻¹ φ_t` is a Hamiltonian isotopy
with a jointly smooth, componentwise normalized Hamiltonian. If `Flux(φ) = 0`, every `A_i(1) = 0`,
so `ψ_1 = id`, and replacing `A_i(t)` by `u A_i(t)`, `u ∈ [0, 1]`, gives an endpoint-fixed symplectic
contraction of `ψ` and an endpoint-fixed homotopy from `φ` to `h`. Prove the converse (a Hamiltonian
isotopy has zero flux) and invariance under endpoint-fixed homotopy. The exported theorem: a smooth
symplectic path has zero flux exactly when it is endpoint-fixed homotopic to a Hamiltonian isotopy
(Banyaga, Propositions II.3.1 and II.3.3 and the diagram after them, pp. 189–191).
This is a statement about path classes; an instantaneous closed form `α_t` need not be exact merely because its time integral is.

*Needs:* §1a.0; Tau Ceti `SmoothTwoForm.hamiltonianVectorField`, `TauCeti.deRhamCohomology`,
`deRhamCohomology.period`, `TauCeti.deRhamCohomologyZeroEquiv`; HeegaardFloer §4.1 (F2.1) (contraction
inverse, primitive and Moser calculus); DifferentialGeometry §§8.3–8.4 (integration over smooth chains),
§1.4 (Cartan calculus), §3.5 (complete flows); AlgebraicTopology §6.1 (real universal coefficients).

**Checks.**
- For `α = 0` on `M = M₁ ⊔ M₂`, the primitives are the locally constant functions `(c₁, c₂)`; the
  componentwise mean-zero condition forces `c₁ = c₂ = 0`, while a single global mean-zero condition
  leaves the line `c₁ vol(M₁) + c₂ vol(M₂) = 0`, so it does not determine `S`.
- On `T² = (ℝ/ℤ)²` with `ω = dx ∧ dy`, the path `φ_t(x, y) = (x, y + t sin(2πx))` has velocity
  `sin(2πx) ∂_y` and `α_t = −sin(2πx) dx = d(cos(2πx)/(2π))`, exact at every time: it is a Hamiltonian
  isotopy with Hamiltonian `cos(2πx)/(2π)` and zero flux. The loop `φ_t(x, y) = (x, y + t)` has `α_t = −dx`
  and flux `−[dx] ≠ 0`, so it is not endpoint-fixed homotopic to a Hamiltonian isotopy, although its
  endpoint, the identity, is Hamiltonian.

### 1a.2 The endpoint quotient and its topology

`M` is compact and connected, as in §1a.0.

*Groups.* Define `Ham(M, ω)` as the set of time-one maps of smooth Hamiltonian isotopies from the
identity with time-end collars and componentwise normalized generating functions, and prove that it
is a subgroup, normal in `Symp(M, ω)` under conjugation, from the actual Hamiltonian paths; the
equality of `Ham` with the kernel of the flux on endpoints is then a theorem about this definition.
Define `Symp₀(M, ω)` as the identity path component of `Symp(M, ω)` in its compact-open `C^∞`
topology, and prove, using collar-fixed relative smoothing, that it consists exactly of the endpoints
of smooth symplectic paths from the identity. Let `Γ_ω ⊆ H¹_dR(M)` be the flux group, the image under
`Flux` of the smooth based loops of symplectomorphisms.

*The algebraic exact sequence.* Construct the endpoint flux homomorphism
`Symp₀(M, ω) → H¹_dR(M) / Γ_ω`, prove that it does not depend on the chosen smooth path, and prove
that

`1 → Ham(M, ω) → Symp₀(M, ω) → H¹_dR(M) / Γ_ω → 0`

is exact (Banyaga, the exact diagram on p. 191, with `Γ` and the endpoint flux defined on p. 184).
Surjectivity uses the complete flow of the vector field obtained by inverting `ω` on a representative
closed one-form; normality and the kernel come from §1a.0 and §1a.1. Prove that the continuous path
and homotopy versions of these groups agree with the smooth collar-fixed versions.

*The diagonal chart.* Apply CotangentLagrangian §4.7's Weinstein neighbourhood theorem to the
compact Lagrangian diagonal in `(M × M, pr₂*ω − pr₁*ω)`, with `graph(h) = {(x, h x)}`; this form is the
negative of CotangentLagrangian's `ω_M − ω_N` and makes the same graphs Lagrangian. Its normal identification at a diagonal point
`(x, x)` sends the tangent vector `(u, v)` to the covector `p = ω(·, v − u)`; fix this order before
computing any flux sign. Using DifferentialGeometry Layer 10's degree and compact covering
comparison with the actual orientations, prove that in a sufficiently small `C^∞` neighbourhood of
the zero section both projections of a cotangent graph to `M` are local diffeomorphisms, and that
compactness and homotopy to the identity make each a covering of degree one, hence a
diffeomorphism. So every small closed one-form gives the graph of a global symplectomorphism, and
the symplectic condition on such a graph is exactly closedness of the one-form. Conversely, if `h` is
sufficiently `C^∞`-close to the identity, prove that the inverse Weinstein image of `graph(h)`
projects locally diffeomorphically to the zero section; it is homotopic to the identity and of degree
one, so this projection is a diffeomorphism and the image is the graph of a unique one-form, written
`θ_h` here to keep it apart from the basis forms `θ_i` of §1a.1. Prove `θ_h` closed because the
graph is Lagrangian. With `ω_can = −dλ`, use `η_h = −θ_h` as the chart coordinate, and prove that the
path of graphs of `−t η_h = t θ_h`, `t ∈ [0, 1]`, has flux `[η_h]`.

*Topology.* Prove that the chart and its inverse are continuous for the `C^∞` topologies, and use the
convex neighbourhoods of zero in the closed one-forms for local contractibility and for
finite-parameter relative smoothing with compatible face maps. Identify the group of path classes
with the universal cover of `Symp₀(M, ω)` and prove that the flux on path classes and the endpoint
map are continuous. The class projection from closed one-forms onto the finite-dimensional
`H¹_dR(M)` has a continuous linear splitting, so the endpoint flux map is open; deduce that it induces
a homeomorphism `Symp₀(M, ω) / Ham(M, ω) ≃ H¹_dR(M) / Γ_ω` for the quotient topologies. These
topological statements assume nothing about discreteness of `Γ_ω`; Hausdorffness of the quotient and
a finite-dimensional Lie group structure on it are not conclusions, and hold only under the
corresponding additional hypotheses on the subgroup.

*Needs:* §1a.0, §1a.1; CotangentLagrangian §4.7 (Weinstein neighbourhood germ);
DifferentialGeometry Layer 10 (degree); Tau Ceti `Diffeomorph.isTopologicalGroup`,
`Diffeomorph.continuous_trans`, `Diffeomorph.continuous_symm`, `CotangentBundle.symplecticForm`.

**Checks.**
- Linearizing the chart at the identity: for `h` the time-`ε` map of a symplectic field `X`, the
  normal component of `graph(h)` at `(x, x)` is `v − u = ε X(x) + O(ε²)`, so
  `θ_h = ω(·, ε X) = −ε ι_X ω + O(ε²)` and `η_h = ε ι_X ω + O(ε²)`, which is the flux `ε [ι_X ω]` of the
  path of time-`εt` maps to first order. With the opposite normal identification `p = ω(·, u − v)` the
  same computation gives flux `−[η_h]`.
- For `M = S²` (or any closed `M` with `H¹_dR(M) = 0`) the exact sequence says
  `Ham(M, ω) = Symp₀(M, ω)`.

### 1a.3 The area-normalized torus lattice

Give `T² = (ℝ/ℤ)²` the product of Tau Ceti's analytic manifold and Lie group structures on the circle
`AddCircle 1` (`AddCircle.instChartedSpace`, `AddCircle.instIsManifold`, `AddCircle.instLieAddGroup`,
for every positive period), through Mathlib's `IsManifold.prod` and `Prod.instLieAddGroup`. For
`ω = A dx ∧ dy` with `A > 0`, prove `Γ_ω = A · H¹(T²; ℤ)` inside `H¹_dR(T²)`, where `H¹(T²; ℤ)` is the
lattice of classes with integral periods (Banyaga, §III.6 up to Lemme III.6.1, pp. 221–223, for
`A = 1` on `T^(2n)`, with the signs used here, and the inclusion of `Γ` in the classes with periods
in the period group of `ω`, p. 184). The translation loop
with velocity `a ∂_x + b ∂_y`, `(a, b) ∈ ℤ²`, has flux `A (a [dy] − b [dx])`, which gives the
inclusion of the integral lattice scaled by `A`. Conversely, the sweep of any integral one-cycle by
any loop of symplectomorphisms is an integral torus two-cycle, so its `ω`-pairing is `A` times an
integer degree, which gives the reverse inclusion. These coordinates have period one; in the family's
angular coordinates `θ_x = 2πx`, `θ_y = 2πy` the form is `(A / 4π²) dθ_x ∧ dθ_y`. Verify the signs
on both coordinate translation loops. The computation uses neither a deformation retraction of the
whole symplectomorphism group nor a general discreteness theorem for flux groups.

*Needs:* §1a.0, §1a.2; Tau Ceti `deRhamCohomology`, `AddCircle.instIsManifold`,
`AddCircle.instLieAddGroup`; Mathlib `IsManifold.prod`, `Prod.instLieAddGroup`.

**Checks.**
- The loop `(x, y) ↦ (x + t, y)` has velocity `∂_x` and `ι_(∂_x)(A dx ∧ dy) = A dy`, so its flux is `A [dy]`,
  which pairs to `A` with the cycle `s ↦ (0, s)`; this agrees with the swept chain `(t, s) ↦ (t, s)`,
  oriented `dt` then `ds`, whose `ω`-area is `A`. The loop `(x, y) ↦ (x, y + t)` has flux `−A [dx]`.
- `Γ_ω` scales with `A`: for `A = 2` the class `[dy]` has period `1 ∉ 2ℤ` on the cycle `s ↦ (0, s)`, so it is
  not in `Γ_ω`; forgetting the area factor would give the integral lattice instead.

### 1a.4 Common compact-support flux

*Groups and the algebraic sequence.* For noncompact `M` consider smooth symplectic paths and
homotopies whose maps are the identity outside one common compact set, so that the forms `α_t` are
closed and compactly supported. Define their compact-support flux in `H¹_c(M)`, Tau Ceti's compactly
supported de Rham cohomology, and define `Ham_c(M, ω)` by Hamiltonians with common compact support.
Prove that the forget-support map `H¹_c(M) → H¹_dR(M)` carries the compact-support flux to the
ordinary flux. Define `Symp_(c,0)(M, ω)` as the set of endpoints of these common-support smooth
symplectic paths; it is not the unrestricted identity component of the ambient symplectomorphism
group in the weak topology. Prove the path-kernel theorem of §1a.1 in this setting and the exact
sequence

`1 → Ham_c(M, ω) → Symp_(c,0)(M, ω) → H¹_c(M) / Γ_(ω,c) → 0`,

where `Γ_(ω,c)` is the image of the common-compact-support loops (Banyaga, Proposition II.1.1 and the
diagram on p. 191, stated there for compactly supported symplectomorphisms of a connected manifold
and `H¹_c`). Vanishing of the flux after forgetting supports is a different hypothesis and does not
give this kernel statement.

*Relative stages.* For each compact support `K` choose a regular compact exhaustion stage
`U_r = {ρ ≤ r}` with `K ⊆ int U_r`, using Tau Ceti's proper exhaustion functions
(`TauCeti.exists_contMDiffMap_isProperMap_nonneg`), DifferentialGeometry §10.2's Sard theorem and
GeometricTopology §1.1's product collars. Choose the stages cofinally so
that every compact component of `M` meeting `K`, or meeting any of the finitely many chosen
representatives or primitive witnesses below, is wholly contained in the final stage; a compact set
meets only finitely many components. On such a component use the componentwise mean of §1a.1 on the
whole component before extending by zero; a bounded piece of a compact component is not treated as
a closed component with its own mean. Set `V_r = int U_r`. Apply DifferentialGeometry §6.4's compactly
supported de Rham theory and DeRhamCohomologyAndDuality Layer 3's relative de Rham theory on the
boundaryless `V_r` and on the open collar `W_ε = c(∂U_r × (0, ε))`, and use two nested collar
widths, collar push-off and excision to compare the colimit over supports with
`H*(U_r, ∂U_r; ℝ)`. Keep the mapping-cone differential `(α, β) ↦ (dα, α|_W − dβ)` and the connecting
map `δ[b] = −[(0, b)]`; a restriction kernel needs its own comparison. Realize the pair `(U_r, ∂U_r)` by a
finite CW pair through a Morse function of GeometricTopology §1.3.1 on the compact triad and MorseTheory
§2.4's CW exhaustion, and use AlgebraicTopology Layer 4's finite CW pairs and relative cellular chains,
its §6.1 singular cochains with real coefficients and the universal coefficient theorem, and
DeRhamCohomologyAndDuality §2.4's relative smooth chains for relative integration.

*Relative period coordinates.* Choose a finite basis of `H₁(U_r, ∂U_r; ℝ)` represented by finite
combinations of smooth loops and arcs inside each component, the arcs following collar-normal
segments near their boundary endpoints. For each fixed compact support sector `K ⊆ V_r` choose `ε`
with `K ∩ W_ε = ∅` and truncate the arcs at endpoints inside a smaller zero collar; integrate the
supported forms over these truncated chains. Prove independence of further truncation inside the zero
collar and compatibility when support sectors enlarge, by choosing a common smaller collar; a common
support sector for sums proves linearity. First assemble the compatible integration functionals on
all compactly supported one-forms: their continuity on each fixed sector gives continuity for the
LF topology. Then restrict to closed forms and descend to `q_r : H¹_c(V_r) → ℝ^b`; a single interior
endpoint is not fixed for all compact supports. Prove that `q_r` is well defined, through the
collar and cone comparison and real universal coefficients, and that its joint kernel on closed
forms is exactly `d C_c^∞(V_r)`. On each fixed compact support sector use its smooth Fréchet topology,
and on `C_c^∞` the compact-support LF topology; prove continuity and parameter differentiation from
the finite integral formulas. Support escaping to the boundary in the unrestricted `C^∞_loc`
topology is not a substitute for this statement.

*Stage maps and collar constants.* For `V_r ⊆ V_s`, enlargement of compact-support complexes is
extension by zero, which is covariant; forgetting supports is the map to ordinary cohomology. Prove
the extension–restriction square only on forms that are extended from the smaller stage, since an
arbitrary restriction need not preserve compact support. An ordinary primitive `f` of a form
vanishing on `W_ε` is constant on each collar component; the obstruction to a primitive vanishing
on the collar is the class of these constants in `H⁰(W_ε; ℝ) / im H⁰(U_r; ℝ)`, with the stated
connecting sign. When it vanishes one may subtract one common constant on each connected component of
`U_r`; components without boundary use their own volume mean. Prove this criterion and its local
parameter formulas. Different components need not share a single collar constant.

*The compact-support primitive selector.* The relative coordinates identify `H¹_c(V_r)` with a
finite-dimensional space. Choose a complement to the kernel of `H¹_c(V_r) → H¹_c(M)`, compactly
supported closed representatives `θ_i` of a basis of its image, representatives `η_j` of a basis of
the kernel, and compactly supported primitive witnesses `F_j` on `M` with `d F_j = η_j`. Enlarge to a
stage `V_s` containing `K`, all representatives and all witness supports. For a globally
compactly-supported exact `α` supported in `V_r`, write `q_r(α) = Σ_j b_j [η_j]`. Then
`α − Σ_j b_j η_j` is relatively exact in `V_r`; construct its zero-collar primitive `S_r` by
fixed-path and radial integration within each component and subtraction of its collar constant, with
component means for closed components, and set

`S α = S_r(α − Σ_j b_j η_j) + Σ_j b_j F_j`, extended by zero,

so that `d S α = α` and `supp S α ⊆ V_s`. Prove `C^k → C^(k+1)` estimates on the fixed-support
sectors, with constants depending on the chosen cycles, paths, witnesses and stages, and joint smooth
finite-parameter and face laws from these formulas. The image-coordinate complement likewise
produces smooth coefficients `a_i(t)` for the compactly supported inverse fields. Reuse the raw flux,
two-parameter and ordered-flow algebra of §1a.0 and §1a.1, proving its compact-support inputs here:
the inverse fields and Hamiltonians have one enlarged compact support, their flows are complete, and
the images of a compact set under a compact parameter family are compact. Thus products, inverses,
zero-flux contractions and endpoint-fixed homotopies fit in one further enlarged stage. Prove that the
constructions do not depend on the stage and enlargement chosen, through the actual comparison maps
and normalization. Neither ordinary exactness nor vanishing after forgetting supports supplies a
compactly supported primitive without these witnesses.

*The support-stage diagonal chart.* For a fixed compact `K` use the evaluation-action subgroup
`Diffeomorph.fixingSubgroup Kᶜ`. On noncompact `M`, equip the ambient diffeomorphism group locally with
the topology induced through `toContMDiffMap` from `ContMDiffMap.manifoldWeakWhitneyTopology`, as a
declared local topology or on a type copy. The map-space topology needs the actual `IsManifold`
hypotheses and no `CompactSpace M`; Tau Ceti's diffeomorphism-group topology and its group theorems are
used only on compact sources. Keep this choice in every restriction and extension comparison. At a
regular stage restrict to maps equal to the identity on a fixed outer collar and extend by the
identity to `M`; prove the restriction, extension and overlap comparisons of the induced weak-Whitney
topologies, and continuity of composition and inversion from the compact-stage APIs and the support
control. No continuity theorem for the unrestricted noncompact diffeomorphism group is assumed.
Construct the support-stage diagonal chart independently of the compact endpoint theorem of §1a.2:
choose buffers `K ⊆ int K₁ ⊆ int K₂ ⊆ V_r` with a fixed outer collar; from GeometricTopology §1.5's
tubular neighbourhood of the diagonal, restricted over the compact buffer `K₂`, and CotangentLagrangian
§4.1's fibre-homotopy construction, match
the full symplectic tensor along the diagonal using `p = ω(·, v − u)`. The difference of the forms then
has a fibre-homotopy primitive `β = O(|p|²)` with parameter and derivative estimates. Use a base cutoff
supported in `K₂` and a radial cutoff at radius `ρ`, equal to one over the inner graph region, and prove
`d(χβ) = O(ρ)` on the compact cutoff region, accounting for the `O(ρ⁻¹)` derivative of the cutoff. For
small `ρ` the closed interpolation stays nondegenerate; its Moser field is supported in a bounded disc
bundle over `K₂`, so it has a common complete flow, the identity near the outer collar. Prove the
resulting germ, the graph, projection and inverse equations, and the `C^k` parameter estimates. For
supported maps sufficiently `C¹`-close to the identity the projections are local diffeomorphisms equal
to the identity off a compact core, and properness makes them coverings on the actual components. On a
noncompact component, a point outside the compact core and outside its compact image has a one-point
fibre, so the covering has one sheet; on compact components use DifferentialGeometry's degree-one argument. Hence the
projections are global diffeomorphisms. Prove continuity of the chart and its inverse, allowing
support enlargement. Convex supported closed-one-form coordinates give finite-dimensional parameter
and relative smooth approximation of paths and homotopies, fixing data already smooth near the
parameter faces and keeping common collars. Export the fixed-stage comparison with its induced
ambient weak-Whitney topology; the common compact support is a hypothesis of this comparison. The
inputs shared with §1a.2 are CotangentLagrangian Layer 4, the DifferentialGeometry, GeometricTopology
and degree inputs and the raw flux calculus, not either endpoint conclusion.

*The compact-support group topology.* Construct a group topology on `Symp_(c,0)(M, ω)` from
translated small diagonal graph charts modelled on the closed compactly supported one-forms with
their LF topology, using a cofinal compact exhaustion and the buffered stage charts above; prove the
chart overlaps, composition and inversion continuous, allowing support enlargement, and prove
independence of the exhaustion and the buffers. On every fixed-support stage this topology induces
the weak-Whitney `C^∞` topology, and its inclusion into the ambient weak-Whitney group is continuous.
These are construction targets: the final topology of an increasing union of topological groups is
not assumed to make multiplication continuous. Prove the regularity of the LF charts that is needed:
a compact subset of a chart lies in a single support stage, and a finite chart cover of a compact
parameter image therefore gives a common stage after accounting for the translations. Deduce that
continuous paths and endpoint-fixed homotopies in this topology have collar-fixed smooth
representatives, and identify the identity path component with `Symp_(c,0)(M, ω)`.

*The topological quotient.* Give `H¹_c(M)` the locally convex quotient topology of the closed
compactly supported one-forms modulo `d C_c^∞(M)`. Prove the comparison with the inductive limit of
the finite relative-stage cohomology spaces through the extension maps and the finite representatives,
and prove the class projection continuous and open; injectivity of the relative-stage maps is not
used. In the support-stage diagonal chart define `θ_h` as the unique compactly supported closed
one-form whose graph is the inverse chart image of `graph(h)`, using the global projection and inverse
equations and the fixed support buffers; put `η_h = −θ_h` and prove that the path of graphs of `t θ_h`
has flux `−[θ_h] = [η_h]`. This `θ_h` is defined by the support-stage chart, independently of §1a.2.
Deduce that the endpoint flux is continuous and open for the compact-support group topology, and
prove the quotient homeomorphism `Symp_(c,0)(M, ω) / Ham_c(M, ω) ≃ H¹_c(M) / Γ_(ω,c)`. The algebraic
exact sequence holds independently of this topology. Neither discreteness of `Γ_(ω,c)`, nor
Hausdorffness of its quotient, nor a finite-dimensional Lie structure is a premise or an automatic
conclusion.

*The topology distinction.* On `M = ℝ_r × (ℝ/ℤ)_θ` with `ω = dr ∧ dθ = d(r dθ)`, choose
`f ∈ C_c^∞(ℝ)` with `∫ f = 1`. The common-support isotopy `(r, θ) ↦ (r, θ − t f(r − R))` has
contraction `f(r − R) dr` and nonzero compact-support flux independent of `R`, while its time-one maps
converge to the identity in the ambient weak `C^∞` topology as `R → ∞`. Prove `Γ_(ω,c) = 0` here: with
`λ = r dθ`, integrate `∂_t (φ_t* λ) = φ_t* ι_X ω + d(φ_t* ι_X λ)` along a common-support loop to obtain a
compactly supported primitive of its integrated contraction. So the endpoint flux is not continuous
on the union of the stages with the induced ambient weak topology. The fixed-stage theorem and the LF
quotient theorem keep their own, distinct topologies.

*Needs:* §1a.0, §1a.1, §1a.2 (only the raw path calculus, not its endpoint conclusions); Tau Ceti
`TauCeti.compactlySupportedDeRhamCohomology`, `compactlySupportedDeRhamCohomology.toDeRhamCohomology`,
`Diffeomorph.fixingSubgroup`, `Diffeomorph.applyMulAction`, `ContMDiffMap.manifoldWeakWhitneyTopology`,
`TauCeti.exists_contMDiffMap_isProperMap_nonneg`; DifferentialGeometry §6.4 (compact supports), §10.2
(Sard), Layer 10 (degree); DeRhamCohomologyAndDuality §2.4 and Layer 3 (relative chains and relative de
Rham theory); GeometricTopology §1.1 (collars), §1.3.1 (Morse functions on compact manifolds with
boundary), §1.5 (tubular neighbourhoods); MorseTheory §2.4 (CW exhaustion); AlgebraicTopology Layer 4
and §6.1 (CW pairs, cochains, real universal coefficients); CotangentLagrangian §4.1 (fibre-homotopy
construction).

**Checks.**
- In the cylinder example, `X = −f(r − R) ∂_θ` and `ι_X (dr ∧ dθ) = f(r − R) dr`; under
  `H¹_c(ℝ × S¹) ≅ H¹_c(ℝ) ≅ ℝ`, given by integration over `ℝ` at fixed `θ`, its class is
  `∫ f = 1 ≠ 0` for every `R`. A flux taken in ordinary cohomology would vanish here, since
  `H¹_dR(ℝ × S¹) ≅ ℝ` is detected by the loop in `θ` and `f(r − R) dr` has zero period on it.
- For a compact component `C` of `M` meeting the support, the selector subtracts the volume mean on
  all of `C`; on `M = S² ⊔ ℝ²` with a form supported in `S²`, the primitive is the mean-zero primitive
  on `S²` extended by zero, and a selector using the mean over a bounded piece `U_r ∩ S² ≠ S²` would
  give a different, non-canonical answer.

### Examples

- On `(ℝ/ℤ)²` with `ω = A dx ∧ dy`, the two coordinate translation loops generate `Γ_ω = A · H¹(T²; ℤ)`
  (§1a.3), and the shear paths `(x, y + t h(x))` with `∫₀¹ h = 0` are Hamiltonian isotopies.
- On `S²` with an area form, `H¹_dR(S²) = 0`, so `Ham = Symp₀` and the flux is trivial.
- The cylinder `ℝ × (ℝ/ℤ)` of §1a.4 separates the compact-support topology from the ambient weak
  topology.

### Dependencies

No other layer of this roadmap. Tau Ceti: the exact sequence of symplectic vector fields, de Rham
cohomology (ordinary, compactly supported, periods), diffeomorphism groups with their weak-Whitney
topologies, diffeotopies, Cartan's formula, proper exhaustions, the circle `AddCircle p`. Mathlib:
product manifolds and Lie groups. DifferentialGeometry §§1.4, 3.5, 5.4, 6.4, 8.3–8.4, 10.2 and
Layer 10. DeRhamCohomologyAndDuality §2.4 and Layer 3. HeegaardFloer §4.1 (F2.1). CotangentLagrangian
§§4.1, 4.7. GeometricTopology §§1.1, 1.3.1, 1.5. MorseTheory §2.4. AlgebraicTopology Layer 4 and §6.1.

<a id="r2-coadjoint-orbits-and-kks"></a>

## Layer 2: coadjoint orbits and the Kirillov–Kostant–Souriau form

§2.1 and §2.2 hold for an arbitrary finite-dimensional Lie group. §2.3 to §2.5 specialize to compact
connected groups, where coadjoint orbits are classified by a closed chamber; that compact
classification is not claimed for noncompact groups, whose orbits keep the homogeneous structure of
§2.1 only.

### 2.1 The coadjoint orbit as a homogeneous manifold

Let `G` be a Lie group with finite-dimensional Lie algebra `𝔤` and `ν ∈ 𝔤*`. Tau Ceti proves that the
coadjoint stabilizer `G_ν = (Lie.coadjointRepresentation ℝ I G).stabilizer ν` is closed
(`Lie.isClosed_stabilizer_coadjointRepresentation`), an embedded Lie subgroup
(`Lie.isEmbeddedLieSubgroup_stabilizer_coadjointRepresentation`), with Lie algebra the annihilator
`𝔤_ν = {ξ | ν([ξ, ·]) = 0}` (`Lie.lieSubalgebraOfSubgroup_stabilizer_coadjointRepresentation`). Apply
SmoothBundlesConnections §B1.4's homogeneous quotient theorem at the closed subgroup `H = G_ν` to obtain
the manifold `O_ν = G / G_ν`, the principal `G_ν`-bundle `G → O_ν` and its local sections; this section
constructs the orbit data, not another general theorem on `G / H`. Define the orbit map
`ι_ν : O_ν → 𝔤*`, `[g] ↦ Ad*_g ν`, prove it smooth and injective (from the definition of `G_ν`), and
prove it an immersion: its derivative at `[1]` is Tau Ceti's injective `Module.Dual.coadjointTangentMap`,
`[ξ] ↦ ξ · ν`, and equivariance moves this to every point. For a noncompact group the immersion need
not be an embedding and its image need not be closed; nothing below assumes either.

*Needs:* SmoothBundlesConnections §B1.4 (homogeneous spaces `G / H`); Tau Ceti
`Lie.coadjointRepresentation`, `Lie.isEmbeddedLieSubgroup_stabilizer_coadjointRepresentation`,
`Lie.lieSubalgebraOfSubgroup_stabilizer_coadjointRepresentation`, `Module.Dual.coadjointTangentMap`,
`Module.Dual.coadjointTangentMap_injective`.

**Checks.**
- For the real Heisenberg group with `[X, Y] = Z` and dual coordinates `(p, q, r)`, the coadjoint
  orbits are the planes `r = r₀` for `r₀ ≠ 0` and the points `(p, q, 0)`; the stabilizer of a covector
  with `r₀ ≠ 0` is the centre, so `O_ν` has dimension 2.
- For `SL(2, ℝ)`, with `𝔤*` identified with `𝔤` through the invariant form `tr(XY)`, the coadjoint orbit
  of a nonzero nilpotent element is one half of the punctured nilpotent cone `{det = 0, X ≠ 0}`; its
  closure contains `0`, so the image of `ι_ν` is not closed in `𝔤*`, and closedness cannot be part of
  the construction.

### 2.2 The Kirillov–Kostant–Souriau form and the orbit moment map

Write `ξ_O` for the fundamental vector field of `ξ ∈ 𝔤` on `O_ν` for the coadjoint action
`ν ↦ ν ∘ Ad_(g⁻¹)`, so that `ξ_O(ν)(η) = −ν([ξ, η])`. Define the Kirillov–Kostant–Souriau form on
generators by

`ω_ν(ξ_O, η_O) = ν([ξ, η])`,

and at `Ad*_g ν` by the same formula with `Ad*_g ν` in place of `ν`. Prove that it does not depend on
the representatives `ξ, η` (the pointwise form is Tau Ceti's `Module.Dual.kksForm` on `𝔤 / 𝔤_ν`), that
it is nondegenerate (Tau Ceti's `Module.Dual.kksForm_nondegenerate`), `G`-invariant and smooth, and that
it is closed, by the invariant formula for `d` on fundamental fields and the Jacobi identity (whose
algebraic part is Tau Ceti's `Module.Dual.kksForm_jacobi`). Prove that the orbit map
`ι_ν : O_ν → 𝔤*` is a coadjoint-equivariant moment map for `ω_ν`: `d⟨ι_ν, ξ⟩ = ι_(ξ_O) ω_ν`, whose
pointwise form is Tau Ceti's `Module.Dual.kksForm_mk_left`. Prove the derivative formula
`dι_ν([ξ]) = ξ_O(ν)`. This is the Kirillov–Kostant–Souriau theorem for an arbitrary Lie group
(Meinrenken, Theorem 7.25, p. 92; Cannas da Silva, Homework 17, p. 139, with the formulas above).

*Comparison with the linear Poisson structure.* Use the positive Lie–Poisson structure
`{ℓ_ξ, ℓ_η} = ℓ_([ξ, η])` of LieGroupoidsPoisson §G4.6A and its sharp convention `β(π♯α) = π(α, β)`
(LieGroupoidsPoisson Conventions). For `α, β ∈ T*_ν 𝔤*` whose sharp images are tangent to the orbit,
prove the pointwise identity

`ω_ν((dι_ν)⁻¹ π♯α, (dι_ν)⁻¹ π♯β) = π_ν(α, β)`,

and its equivalent form after applying `dι_ν`. This fixes the dual and sign adapter between the two
structures; it does not identify symplectic leaves with coadjoint orbits, which is
LieGroupoidsPoisson §G4.6B's theorem, built on its §G4.5 leaves without the KKS form.

*Further structure.* Prove that `dim O_ν = dim 𝔤 − dim 𝔤_ν` is even (its linear part is Tau Ceti's
`Module.Dual.even_finrank_quotient_lieAnnihilator`); that the coadjoint orbit of `(ν₁, ν₂)` for
`G₁ × G₂` is the product of the orbits, with the sum of the KKS forms; and that for a covering
`G̃ → G` with discrete central kernel the orbits and KKS forms of `G̃` and `G` agree under the
identification of their Lie algebras.

*Needs:* §2.1; Tau Ceti `Module.Dual.kksForm`, `Module.Dual.kksForm_nondegenerate`,
`Module.Dual.kksForm_jacobi`, `Module.Dual.kksForm_mk_left`,
`Module.Dual.even_finrank_quotient_lieAnnihilator`, `SmoothTwoForm.IsEquivariantMomentMap`,
`SmoothTwoForm.IsSymplectic`; LieGroupoidsPoisson §G4.6A and Conventions (Lie–Poisson and sharp
signs).

**Checks.**
- `SO(3)` with `𝔰𝔬(3) ≅ ℝ³` through `ξ ↦ (v ↦ ξ × v)`, so `[ξ, η] = ξ × η`, and `𝔤* ≅ ℝ³` through the
  dot product. Then `ξ_O(ν) = ξ × ν`, the orbit through `ν` with `|ν| = r > 0` is the sphere of radius
  `r`, and `ω_ν(ξ × ν, η × ν) = ν · (ξ × η)`. Since `(ξ × ν) × (η × ν) = (ν · (ξ × η)) ν`, the form is
  `ω = (1/r) dA` for the outward-oriented area form `dA`, and the total area is `4πr² / r = 4πr`. The
  opposite sign `−ν([ξ, η])` gives `−4πr` and breaks `d⟨ι_ν, ξ⟩ = ι_(ξ_O) ω_ν`, whose two sides are both
  `ν([ξ, η])` on `η_O` with the sign above.
- Heisenberg: for `ξ = sX + tY + uZ`, `ξ_O(p, q, r) = (t r, −s r, 0)`, and
  `ω(ξ_O, η_O) = r (s t' − t s')`, so on the plane `r = r₀ ≠ 0` the form is `dp ∧ dq / r₀`.
- With the sharp convention `β(π♯α) = π(α, β)`, `π♯ dℓ_ξ = −ξ_O`, so the comparison identity holds
  with no sign change, and `π♯ dℓ_ξ = −X_(ℓ_ξ)` agrees with LieGroupoidsPoisson §G4.3.

### 2.3 Compact connected groups: the real root data

Let `K` be a compact connected Lie group. Consume from LieGroups Layer 5A its `Ad`-invariant positive
inner product `B` on `𝔨` and the orthogonal splitting `𝔨 = 𝔷(𝔨) ⊕ [𝔨, 𝔨]`, and from LieGroups Layer 6
its compact real root data: existence, conjugacy and exhaustion of maximal tori, the real root
characters `χ_α` with `dχ_α = iα`, the real root and coroot pairing, the comparison of the geometric
Weyl group `N_K(T)/T` with the abstract Weyl group, the rank-one reflection representatives, and the
theorem that every element of `𝔨` is conjugate into `𝔱`. Tau Ceti supplies the maximal tori
(`Lie.IsMaximalTorus`, `Lie.exists_isMaximalTorus`) and the finiteness of the Weyl group
(`Lie.IsMaximalTorus.finite_normalizerQuotient`). Through `B` identify `𝔨` with `𝔨*` and `𝔱` with
`𝔱*`, and carry the centre as an unrestricted Euclidean factor: the roots vanish on `𝔷(𝔨)` and span
only `𝔱*_ss`. The closed chamber `𝔱*_(ss,+)` is Tau Ceti's `RootPairing.dominantChamber` of the real root
system for a chosen base; its strict fundamental-domain theorem
`TauCeti.existsUnique_mem_orbit_inter_dominantChamber` and wall-stabilizer theorem
`TauCeti.stabilizer_eq_closure_wallReflections` are consumed as stated. The integral refinements
(kernel of the exponential, character lattice) are ConvexityToric §1.1's and are not inputs here.

*Needs:* LieGroups Layers 5A and 6; Tau Ceti `Lie.IsMaximalTorus`,
`Lie.IsMaximalTorus.finite_normalizerQuotient`, `RootPairing.dominantChamber`,
`TauCeti.existsUnique_mem_orbit_inter_dominantChamber`, `TauCeti.stabilizer_eq_closure_wallReflections`.

**Checks.**
- For `K = U(n)` with the invariant pairing `⟨H, X⟩ = −i tr(HX)` between Hermitian and skew-Hermitian
  matrices, the centre `𝔷 = iℝ · 1` is orthogonal to `[𝔨, 𝔨] = 𝔰𝔲(n)`, and the roots `x_j − x_k` of the
  diagonal torus vanish on the centre. A chamber taken in all of `𝔱*` instead of `𝔱*_ss` would not be
  pointed: it contains the line `𝔷*`.

### 2.4 Weyl-relatedness and dominant representatives

For `X, Y ∈ 𝔱` with `Ad_g X = Y`, both `T` and `g T g⁻¹` lie in `Z_K(Y)⁰`, being connected and
centralizing `Y`; they are maximal tori there, so conjugacy in that compact connected group gives
`c ∈ Z_K(Y)⁰` with `c g ∈ N_K(T)`, and `Ad_(cg) X = Y`. Prove `exists_mem_normalizer_Ad_eq`: for a
compact connected Lie group `K`, a maximal torus `T` with Lie algebra `𝔱`, and `X, Y ∈ 𝔱` with
`Ad_g X = Y` for some `g`, there is `n` in the normalizer of `T` with `Ad_n X = Y` (Alexandrino–Bettiol,
the remark after Definition 4.28, p. 84: the Weyl group orbits in `𝔱` are the intersections of `𝔱`
with the adjoint orbits). The argument does not
assume the full centralizer `Z_K(Y)` connected. Through LieGroups Layer 6's comparison the action of
`N_K(T)/T` on `𝔱_ss` is the abstract Weyl action, and it fixes the centre; the uniqueness half of
`TauCeti.existsUnique_mem_orbit_inter_dominantChamber` then proves that two dominant Weyl-related
points are equal, and with dominant existence every coadjoint orbit contains exactly one point of
`𝔷(𝔨)* × 𝔱*_(ss,+)` (Alexandrino–Bettiol, Theorem 4.31 (ii), p. 85, for adjoint orbits and the
closure of a Weyl chamber in `𝔱`, which contains the centre). No uniqueness argument for the open
chamber replaces the closed-wall theorem.

*Needs:* §2.3; LieGroups Layer 6 (maximal-torus conjugacy, conjugation into `𝔱`, Weyl comparison);
Tau Ceti `Lie.Ad`, `Lie.lieSubalgebraOfSubgroup`, `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`.

**Checks.**
- For `U(n)`, `X = diag(i a₁, …, i aₙ)` and `Y` a diagonal matrix with the same entries permuted are
  conjugate, and a permutation matrix, which normalizes the diagonal torus, conjugates one to the
  other; the dominant representative has `a₁ ≥ ⋯ ≥ aₙ`.
- For `SU(2)` with `T` the diagonal torus and `X = diag(i, −i)`, the elements `X` and `−X` of `𝔱` are
  conjugate, by `n = [[0, 1], [−1, 0]]`, which normalizes `T` and acts on `𝔱` by `−1`; no element of `T`
  conjugates them, since `Ad(T)` is trivial on `𝔱`. A version of the statement with the conjugating
  element in `T` is therefore false, and the normalizer is needed.

### 2.5 The chamber quotient and connected centralizers

Construct the quotient homeomorphism `𝔨* / K ≃ 𝔷(𝔨)* × 𝔱*_(ss,+)`: the map from the chamber to the orbit
space is a continuous bijection by §2.4, and it is proper, using the invariant norm, compactness of
closed bounded subsets of the finite-dimensional chamber and Hausdorffness of the quotient of a space
by a compact group. For dominant `X`, compute `Lie Z_K(X)` as `𝔱` plus the real root planes with
`α(X) = 0`. Prove `isConnected_stabilizer_coadjointRepresentation`: for a compact connected Lie group
`K` and `ν ∈ 𝔨*`, the coadjoint stabilizer `K_ν` is connected (Alexandrino–Bettiol, Lemma 4.26,
pp. 83–84, for the adjoint stabilizer of an element of `𝔱`, which conjugation and `B` carry to every
`ν`). Under `B` it is the centralizer `Z_K(X)`
of `X` with `ν = B(X, ·)`, and one may take `X` dominant. For `g ∈ Z_K(X)`, conjugate `g T g⁻¹` to `T`
inside `Z_K(X)⁰` as in §2.4; the resulting Weyl element fixes `X`, so by
`TauCeti.stabilizer_eq_closure_wallReflections` it is a product of reflections in walls through `X`.
Each such wall reflection has LieGroups Layer 6's rank-one representative in `Z_K(X)⁰`, since
`α(X) = 0`, and with `T ⊆ Z_K(X)⁰` these representatives remove the residual Weyl element, so `g` lies in
the identity component. Prove that the stabilizers are closed, compare the stabilizer types with the
faces of the chamber, and determine which root planes enter on every wall. These compact-group
applications consume LieGroups Layer 6's real root and rank-one theorems and Tau Ceti's closed-wall
theorems without reproving them; they precede ConvexityToric §3.1's cross-section and convexity
application. The regular orbit `K/T` and the singular partial flags are examples of these orbits, not
definitions.

*Needs:* §2.4; LieGroups Layer 6 (rank-one representatives); Tau Ceti
`TauCeti.stabilizer_eq_closure_wallReflections`, `Lie.isClosed_stabilizer_coadjointRepresentation`.

**Checks.**
- In `SO(3)` the centralizer of a nonzero `X ∈ 𝔰𝔬(3)` is the circle of rotations about its axis, and
  the stabilizer of `0` is `SO(3)`: both connected. The centralizer of a group element can be
  disconnected: for `u = diag(1, −1, −1) ∈ SO(3)` it is `O(2)`. A version of the theorem for group
  elements is therefore false, and the Lie-algebra version is what is claimed.
- In `U(3)`, the dominant `X = diag(i, i, 0)` has centralizer `U(2) × U(1)`, connected, of dimension
  `4 + 1 = 5`, which is `dim 𝔱 = 3` plus the two-dimensional root plane of `α = x₁ − x₂`, the only
  positive root with `α(X) = 0`.
- For the compact disconnected group `O(2)`, the stabilizer of `0 ∈ 𝔬(2)*` is all of `O(2)`, which is
  disconnected: connectedness of `K` cannot be dropped.

### 2.6 Model orbits

- *`U(n)`.* Fix `⟨H, X⟩ = −i tr(HX)` for Hermitian `H` and skew-Hermitian `X`, so that the diagonal
  projection is the moment map of the maximal torus in the real coordinates `θ`. Compute the orbit
  orientation induced by `ω_ν` instead of assuming the standard complex orientation of the flag
  manifold.
- *`SO(3)`.* Use `ξ ↦ (v ↦ ξ × v)`, `[ξ, η] = ξ × η`, and identify `ν` with its dot-product vector; the
  sphere of radius `r > 0` has KKS area `4πr` (§2.2's Check).
- *`SU(2)`.* Use the basis `−iσ_a / 2` of `𝔰𝔲(2)`, which has the same cross-product bracket; the sphere
  formula stays `4πr`, but the maximal-torus generator `−iσ₃ / 2` has period `4π`, and passing to
  `SO(3) = SU(2)/{±1}` changes the weight lattice.
- *The real Heisenberg group.* Prove that Tau Ceti's `TauCeti.Nil`, the analytic manifold `ℝ × ℝ × ℝ`
  with the product `(a, b, c)(x, y, z) = (a + x, b + y, c + z + a y)`, is an analytic Lie group: its
  product and its inversion `(x, y, z)⁻¹ = (−x, −y, −z + x y)` are polynomial. `TauCeti.Nil.toHeisenberg`
  identifies it with `TauCeti.HeisenbergGroup ℝ` as a group. Compute its coadjoint orbits and their forms
  (§2.1's and §2.2's Checks) and contrast its odd-dimensional adjoint orbits, the affine lines
  `aX + bY + ℝZ` for `(a, b) ≠ (0, 0)`, with its even-dimensional coadjoint orbits.

*Needs:* §2.2, §2.5; Mathlib `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`,
`Matrix.specialOrthogonalGroup`; Tau Ceti `TauCeti.Nil`, `TauCeti.Nil.toHeisenberg`.

**Checks.**
- `[−iσ_a / 2, −iσ_b / 2] = −¼ [σ_a, σ_b] = −¼ · 2i ε_abc σ_c = ε_abc (−iσ_c / 2)`, the cross-product
  bracket; `exp(t · (−iσ₃ / 2)) = diag(e^(−it/2), e^(it/2))` has period `4π`, while the corresponding
  rotation in `SO(3)` has period `2π`.
- For `U(n)`, `−i tr(H X)` is real: with `X = iY`, `Y` Hermitian, it is `tr(HY)`.

### Examples

- The regular orbit of `U(3)` through `diag(1, 0, −1)` (under `⟨·,·⟩`) is the full flag manifold, of
  dimension `6 = 2 · 3` (three positive roots); the orbit through `diag(1, 0, 0)` is `ℂP²`, of dimension
  `4`.
- The product of coadjoint orbits of `SU(2) × SU(2)` is a product of spheres with the sum of the KKS
  forms (§2.2).

### Dependencies

SmoothBundlesConnections §B1.4 (homogeneous spaces). LieGroupoidsPoisson §G4.6A and Conventions (the
Lie–Poisson and sharp signs; §G4.3, §G4.5 and §G4.6B are compared with, not used). LieGroups Layers
5A and 6. Tau Ceti: the coadjoint representation and its stabilizers, the linear KKS form, maximal
tori and the Weyl group, and the closed-chamber theorems for root systems.

## Layer 2a: compact orbit heights, root-plane Hessians and Morse attachments

Work on the homogeneous coadjoint orbit `O_μ = K / K_μ` of §2.1 for a compact connected Lie group `K`,
with the `Ad`-invariant positive inner product `B` of §2.3 and the identification `𝔨 ≃ 𝔨*` it gives.
Choose a maximal torus `T`, the real root characters of LieGroups Layer 6 and a positive system. The
label `μ` lies in the real closed chamber of `𝔱`; it need not be an integral weight. Roots and coroots
concern the semisimple summand; keep the central summand and the actual torus lattice. The orbit
carrier, its tangent quotient and its KKS form are those of Layer 2; this layer constructs no other
orbit carrier. The critical Hessian, nondegenerate critical points and the Morse index are Tau Ceti's
(`TauCeti.criticalHessian`, `TauCeti.IsManifoldNondegenerateCriticalPoint`,
`TauCeti.manifoldMorseIndex`); handles and finite CW models are MorseTheory §§2.3–2.4's, with Tau
Ceti's level-by-level form `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`; the Morse–Bott
attachment along negative normal bundles is MorseTheory §5.1's. This layer constructs the orbit
derivatives and Hessians and compares them with these interfaces.

### 2a.1 Height functions and their critical sets

For `X ∈ 𝔱` put `f_X(p) = B(p, X)` on `O_μ`. Prove that `f_X` is smooth and that
`ξ_O(p) = [ξ, p]`, `d f_X = ι_(X_O) ω` and `Crit(f_X) = {p ∈ O_μ | [X, p] = 0}`. These use Layer 1's
left fundamental fields and Layer 2's coadjoint action `ν ↦ ν ∘ Ad_(g⁻¹)`. The convention
`⟨ξ · ν, η⟩ = ⟨ν, [ξ, η]⟩` found in the literature uses the opposite infinitesimal vector: construct the
identity-on-the-orbit comparison `ξ_source = −ξ_O`, which preserves `ω` and changes the contraction
equation to `ι_(ξ_source) ω = −d f_ξ`; do not negate the form or the moment component to identify the
two equations. Fix the quotient derivative `q_p : A ↦ [A, p]` before computing second derivatives.

*Needs:* §2.2, §2.3; Layer 1 (fundamental fields); Tau Ceti `fundamentalVectorField`.

**Checks.**
- On the `SO(3)`-orbit of radius `r` (§2.2's Check) with `X = a Z`, `a ≠ 0`, `f_X` is `a` times the height
  `z`, and its critical points are the poles `±r Z`, where `[X, p] = a Z × p = 0`; for `a = 0` the function
  is constant and every point is critical (§2a.5).

### 2a.2 Root planes, the KKS form and the Hessian

For each pair `{α, −α}` of roots take its real plane `E_α` and construct its `B`-orthogonal rotation
`J_α` with `J_α² = −Id` and `ad_H|E_α = α(H) J_α` for `H ∈ 𝔱`, with the normalization `dχ_α = iα`. At
`p ∈ 𝔱 ∩ O_μ` the tangent space of `O_μ` is the orthogonal sum of the `E_α` with `α(p) ≠ 0`; planes with
`α(p) = 0` belong to the stabilizer and are not tangent directions. Identify this sum with the native
tangent space by the actual derivative of the inclusion. On each such plane prove `q_p = −α(p) J_α`
and

`ω_p(v, w) = B(J_α v, w) / α(p)`,
`Hess_p(f_X)(v, w) = −α(X) B(v, w) / α(p)`,
`Hess_p(f_X)(q_p A, q_p C) = −α(X) α(p) B(A, C)`.

Prove that there are no cross terms between distinct root planes, symmetry, and the congruence in
quotient coordinates. Derive the Hessian either by differentiating `d f_X = ι_(X_O) ω` at its zero or
from `d²/dt² B(Ad_(exp(tA)) p, X)|_(t=0) = −B([A, p], [A, X])`, and compare the two calculations.
Construct a `T`-equivariant local chart from an invariant Riemannian exponential on the homogeneous
orbit, prove that its differential is the chosen tangent identification, and transport the result to
Tau Ceti's intrinsic `TauCeti.criticalHessian` and to the preferred-chart predicates
`TauCeti.IsManifoldNondegenerateCriticalPoint` and `TauCeti.manifoldMorseIndex`. A count of root-plane
signatures without this chart and congruence comparison does not establish a manifold Morse statement.

*Needs:* §2a.1; LieGroups Layer 6 (root characters); Tau Ceti `TauCeti.criticalHessian`,
`TauCeti.manifoldMorseIndex_eq_sigNeg_criticalHessian`, `TauCeti.IsManifoldNondegenerateCriticalPoint`,
`TauCeti.manifoldMorseIndex`.

**Checks.**
- `SO(3)` with `B` the dot product under `ξ ↦ (v ↦ ξ × v)`, `Z` a unit generator of period `2π`, `r > 0`,
  `p = r Z`, `X = a Z`: `ad_(hZ)` acts on the plane `Z^⊥` as `h` times the rotation `J = Z × ·`, so
  `α(hZ) = h`, `α(p) = r`, `α(X) = a`. Then `q_p(A) = A × rZ = −r J A`, the KKS form is
  `ω_p(v, w) = (Z × v) · w / r`, and the height `a z` on the sphere of radius `r` near the north pole
  is `a (r − (x² + y²)/(2r)) + O(4)`, so `Hess = −(a / r) B`, as the formula says.
- Both derivations agree there: `−B([A, p], [A, X]) = −B(−r J A, −a J A) = −a r B(A, A)`. The two
  coordinate systems must not be confused: for `r = 2`, `a = 1` and a unit vector `A`, the Hessian is
  `−1/2` on the tangent vector `A` and `−2` on the quotient coordinate `A`, the tangent vector `q_p A`;
  they differ by the factor `α(p)² = 4`.

### 2a.3 Regular heights: Morse indices

If `X` is regular, meaning `α(X) ≠ 0` for every root, prove `Crit(f_X) = O_μ ∩ 𝔱 = W μ`, using the
centralizer and chamber theorems of §2.4 and §2.5. With `W_μ` the stabilizer of `μ`, identify the
critical points with `W / W_μ`, using minimal right-coset representatives and the parabolic subgroup
generated by the simple roots vanishing on `μ`. For regular `μ` this is `W` once `μ` is chosen as base
point; without that choice the full-flag indexing is a `W`-torsor. Prove that `f_X` is Morse with

`index_p(f_X) = 2 · #{α ∈ Φ⁺ | α(p) ≠ 0 and α(X) α(p) > 0}`.

Equivalently, the index of `−f_X` at `p` is twice the number of root hyperplanes separating `p` from
`X` (Bott, Proposition 11.4 and Theorem III, p. 271, there for the energy of segments from the orbit
to a regular point `X ∈ 𝔱`, which on the orbit is a positive multiple of `−f_X` plus a constant).

With `μ` dominant and `X` in the open positive chamber this is `dim(O_μ) − 2 ℓ(w)` at `p = w μ`, `w` a
minimal coset representative; with `X` in the open negative chamber it is `2 ℓ(w)`; equivalently
`index_(wμ)(−f_X) = 2 ℓ(w)` for positive `X`. Prove the length formulas on `W / W_μ`, excluding the
stabilizer roots, rather than using the full-flag dimension on a wall. The values `B(w μ, X)` need not
be distinct for every regular `X`: prove the finite hyperplane avoidance that makes them distinct when
needed, and otherwise use simultaneous critical-level attachments. Construct dense one-parameter
generators in each open chamber by the torus character and density criterion, and show that the fixed
set of their flow is the `T`-fixed set. Density is a sufficient hypothesis of that construction, not an
extra hypothesis of the regular-`X` theorem.

*Needs:* §2a.2, §2.4, §2.5; Tau Ceti `TauCeti.IsMorse`, `Lie.IsTorus.exists_closedZpowers_eq`
(topological generators of tori).

**Checks.**
- On `S² = SO(3)/T` with `μ = r Z`, `r > 0`, and `X = a Z`, `a > 0`: `W = {±1}`; at `p = r Z`,
  `α(X) α(p) = a r > 0` and the index is `2 = dim O_μ − 0`; at `p = −r Z`, `α(p) = −r` and the index is
  `0 = 2 − 2 ℓ(s)`. The sum `Σ (−1)^index = 2 = |W|`. A Hessian with the opposite sign would make the
  north pole a minimum of `a z`, which it is not.
- For `U(3)` and regular `μ`, the indices of a positive regular height are `6 − 2ℓ(w)` for the six
  `w ∈ S₃`, that is `6, 4, 4, 2, 2, 0`, with Poincaré polynomial `1 + 2t² + 2t⁴ + t⁶`.

### 2a.4 The CW model and the topology of `O_μ`

Apply MorseTheory §§2.3–2.4's compact-band attachments and its cellular and singular comparisons to
obtain a finite CW model of `O_μ` with one cell of the even index of §2a.3 at each critical point.
Construct its comparison map to the orbit and label the orientation of each negative handle by its
negative Hessian plane sum, with a fixed ordering of the roots. Deduce that the integral homology and
cohomology of `O_μ` vanish in odd degrees and are free in even degrees with the critical cells as
bases; prove the index generating polynomial and `χ(O_μ) = |W / W_μ|` (Bott, Theorem III and
Proposition 11.5, pp. 271–272: the orbit has no torsion and no odd Betti numbers, with one generator
for each point of `W μ`). The even cellular differential
is zero, but this alone is not a computation of the cohomology ring. For the full flag obtain
`χ(K/T) = |W|` and simple connectivity from the connected CW model with one zero-cell and no one-cells.
SchubertGeometry §9.7 makes the comparison of characteristic maps and orientations with Schubert
cells; the gradient trajectories of an arbitrary invariant metric are not declared to be Schubert
cells.

*Needs:* §2a.3; MorseTheory §§2.3–2.4 (handles, CW exhaustion); Tau Ceti
`TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`; AlgebraicTopology Layer 4 (cellular
homology of CW pairs).

**Checks.**
- `χ(ℂP²) = 3 = |S₃ / (S₁ × S₂)|` for the orbit of `U(3)` through `diag(1, 0, 0)`; `χ(U(3)/T) = 6 = |S₃|`.

### 2a.5 Degenerate heights and Morse–Bott attachments

For arbitrary `X ∈ 𝔱`, construct `Crit(f_X)` as the finite union of `K_X`-orbits indexed by
`W_X \ W / W_μ`, where `K_X` is the connected centralizer of §2.5 and `W_X` its Weyl group. Prove that
these are embedded critical submanifolds, that the kernel of the Hessian is their tangent space, and
that on the remaining root planes the Hessian has the formula of §2a.2 with `α(X) α(p) ≠ 0`. Construct
the smooth positive and negative normal bundles and their complex orientations through an invariant
compatible almost complex structure, and apply MorseTheory §5.1's attachment with these bundles. A
central `X`, including `X = 0`, gives a constant function on `O_μ`, which is Morse only when the orbit is
a point and Morse–Bott with the whole orbit critical otherwise. For a central `μ`, including `μ = 0`, the
orbit is a point, its zero-dimensional Hessian is nondegenerate and its index is `0`. A torus has no
roots and all its coadjoint orbits are points. Indices add over products, and central components add
a constant to `f_X`. Finite central coverings preserve these real orbit forms and indices while keeping
their different integral character lattices.

*Needs:* §2a.2, §2.5; MorseTheory §5.1 (critical normal bundles and attachments).

**Checks.**
- On the full flag of `U(3)` with `X = diag(i, i, 0)` (not regular), the critical set is a union of
  `|W_X \ W| = |S₂ \ S₃| = 3` orbits of `K_X = U(2) × U(1)`, each a copy of `ℂP¹`; their Euler
  characteristics add to `3 · 2 = 6 = χ(U(3)/T)`.

### 2a.6 Comparison with the group-theoretic route

Give the topological and group-theoretic arguments of the literature as comparisons with the
independently constructed outputs of LieGroups Layer 6, downstream of them. For a maximal torus `T₀`
put `C = Z_K(T₀)`. Using the compact abelian exponential and character-density criterion, choose
`μ ∈ Lie(T₀)` with the closure of `exp(ℝ μ)` equal to `T₀`, in an open chamber when roots occur. Prove
`K_μ = Z_K(μ) = Z_K(T₀) = C`: if `Ad_g μ = μ` then `g` commutes with every `exp(tμ)`, hence with their
closure `T₀`, and the converse follows by differentiation. Through `B` and the orbit map of §2.1
identify `O_μ = K / K_μ` with `K / C`, including its quotient projection and homogeneous smooth
structure. Using only the weaker identity-component input `C⁰ = T₀`, from `Lie(C) = Lie(T₀)` (Tau Ceti's
`Lie.IsMaximalTorus.lieSubalgebraOfSubgroup_centralizer`) and the classification of connected compact
abelian groups, make `C / T₀` finite and construct the covering `K / T₀ → K / C`. Apply §2a.3 and §2a.4
to this `O_μ`: its connected finite CW model has only even cells, hence one zero-cell and no one-cells,
and cellular approximation makes it simply connected. Since `K / T₀` is connected, the covering has one
sheet and `C = T₀`. This comparison assumes neither full self-centralization to identify the orbit nor
it to construct the covering. With `χ(K/T) ≠ 0` and `K` connected, left translation by any `k ∈ K` is
homotopic to the identity, so its Lefschetz number is `χ(K/T)`; MorseNovikov §6.4's Lefschetz
fixed-point formula, which needs no isolated fixed points for the existence statement, gives a fixed
point, so `k` is conjugate into `T`. A dense cyclic generator of another maximal torus then gives
conjugacy of maximal tori. Use the local fixed-point index sum only under its isolated-fixed-point
hypotheses. These comparisons add no dependency of LieGroups Layer 6 on this layer.

*Needs:* §2a.3, §2a.4, §2.1; LieGroups Layer 6; MorseNovikov §6.4 (Lefschetz fixed-point formula);
Tau Ceti `Lie.IsMaximalTorus.lieSubalgebraOfSubgroup_centralizer`, `Lie.IsTorus.exists_closedZpowers_eq`.

**Checks.**
- For `K = SU(2)`, `C = Z_K(T₀) = T₀`, `K / T₀ = S²` with `χ = 2 = |W|`, and left translation by any `k`
  has a fixed point `g T₀`, i.e. `g⁻¹ k g ∈ T₀`.

### 2a.7 Model computations and range tests

- *Heisenberg.* In the real Heisenberg algebra with `[X, Y] = Z`, the adjoint orbit of `aX + bY + cZ`
  with `(a, b) ≠ (0, 0)` is the affine line `aX + bY + ℝZ`, and central elements have point orbits. In
  dual coordinates `(p, q, r)` the coadjoint orbits with `r ≠ 0` are the planes `r = const` with form
  `dp ∧ dq / r`, and those with `r = 0` are points. Construct the lower-triangular trace-pairing model
  of the dual and its projection and action equation. This explains the odd-dimensional adjoint orbits
  without contradicting the even dimension of coadjoint orbits.
- *`SO(3)`.* Normalize `B` to the dot product under `ξ ↦ (v ↦ ξ × v)`, take a unit generator `Z` of
  period `2π`, `r > 0`, `p = r Z` and `X = a Z`. Check `Hess = −(a / r) B` on the tangent plane and
  `∫ ω = 4πr` with the KKS orientation. For `B = c · dot`, `c > 0`, the same sphere of radius `r` in the
  Lie algebra has `∫ ω = 4πcr`, its covector radius being `cr`. A negative label `r Z`, `r < 0`, lies on
  the sphere of radius `|r|` with a different base point and has area `4πc|r|`, not a negative symplectic
  area; `r = 0` is the point orbit.
- *`SU(2)`.* Use the brackets of `−iσ_a / 2`, normalize that basis to be `B`-orthonormal, and keep the
  period `4π` rather than `SO(3)`'s period `2π`. Compare the orientation of `ℂP¹` with the KKS orientation
  and the two critical indices.
- *`U(n)`.* Keep the moment pairing `−i tr(HX)` and the partial-flag examples on the walls.
- *Maximal abelian subgroups.* Distinguish maximal abelian subgroups from maximal connected abelian
  subgroups: the latter are the maximal tori, while simply connected compact groups can have nontoral
  finite abelian subgroups. As an explicit test in `Spin(7)`, take the negative orthonormal Clifford
  convention `e_i² = −1` and `e_i e_j = −e_j e_i` for `i ≠ j`. The elements `−1`, `e₁e₂e₃e₄`, `e₁e₂e₅e₆`
  and `e₁e₃e₅e₇` generate an elementary abelian group of order 16: each fourfold product squares to 1,
  the pairwise intersections of the supports have size 2, so the products commute, and the three
  support vectors are independent over `𝔽₂`, with an independent scalar sign. Compare ordered
  products with the Clifford basis, and map these even unit products into Tau Ceti's Spin carrier,
  using SpinGeometry §1.1's transport between the positive and negative even Clifford algebras when
  starting from the positive-definite compact model. Tau Ceti's
  `CliffordAlgebra.simplyConnectedSpace_realCliffordSpinGroupZero` supplies the compact simply connected
  topology; the block torus of `SO(7)` and the derivative comparison of the finite cover give rank 3, so
  a torus has at most 8 elements of order dividing 2. This disproves the unqualified converse for
  simply connected groups (every maximal abelian subgroup a torus) while keeping the valid
  self-centralizing and maximal-torus statements. A common torus for every finite commuting family is
  not inferred from connectedness of the individual centralizers.

*Needs:* §2.2, §2.6, §2a.2; SpinGeometry §1.1 (G1.1); Tau Ceti
`CliffordAlgebra.simplyConnectedSpace_realCliffordSpinGroupZero`, `TauCeti.heisenberg`.

**Checks.**
- `(e₁e₂e₃e₄)² = (−1)^(4·3/2) (e₁²)(e₂²)(e₃²)(e₄²) = (+1)(+1) = 1`; for supports `S, T` of size 4,
  `e_S e_T = (−1)^(|S||T| − |S ∩ T|) e_T e_S = (−1)^(16 − 2) e_T e_S = e_T e_S`; the supports
  `1234, 1256, 1357` have pairwise sums `3456, 2457, 2367` and total sum `1467`, all nonzero, so they are
  independent over `𝔽₂`, and every element of the group is `±e_V` with `|V| ∈ {0, 4}`, squaring to 1.
  An elementary abelian group of order `16 = 2⁴` does not embed in a rank-3 torus, whose 2-torsion
  is `(ℤ/2)³`.
- Heisenberg adjoint orbits: `Ad_(exp w) v = v + [w, v]` because `ad_w² = 0` on this algebra, and
  `[sX + tY, aX + bY] = (sb − ta) Z`, which ranges over `ℝZ` when `(a, b) ≠ (0, 0)`.

### Examples

- The orbit of `U(n)` through `diag(1, 0, …, 0)` is `ℂP^(n−1)`, with Morse indices `0, 2, …, 2n − 2`
  for a regular height and `χ = n`.
- `SO(3)` and `SU(2)` have the same orbits and areas (§2a.7) and different torus periods.

### Dependencies

Layer 2 (§§2.1–2.6). LieGroups Layers 5A and 6. MorseTheory §§2.3–2.4 and §5.1. MorseNovikov §6.4.
SpinGeometry §1.1. AlgebraicTopology Layer 4. Tau Ceti: critical Hessians, Morse indices and
sublevel CW models, tori and their generators, the compact simply connected Spin carrier.
SchubertGeometry §9.7 consumes this layer and is not an input.

## Layer 3: regular reduction and its universal property

The layer has three branches sharing the level data of §3.0: the free regular branch (§3.0a to
§3.0c), with quotients by discrete groups in §3.0d; the locally free branch with finite isotropy
(§3.0e); and the singular branch, built on the local normal form of §3.1 (§3.2). A singular level is
not assumed regular or free anywhere. The sections before §3.1 are numbered `3.0` and `3.0a`–`3.0e` so
that §3.1 and §3.2 keep their numbers. Throughout, `(M, ω)` is symplectic, `G` acts by a smooth
symplectic action (Conventions 2) and `μ : M → 𝔤*` is a group-level moment map,
`SmoothTwoForm.IsEquivariantMomentMap` (Cannas da Silva, Definition 22.1, pp. 133–134).

### 3.0 Shared level data

Tau Ceti proves the pointwise identities of a moment map: `⟨dμ_x(v), ξ⟩ = ω(ξ_M(x), v)`, so that
`ker dμ_x = (𝔤 · x)^ω` (`SmoothTwoForm.IsMomentMap.ker_differential`) and, for a nondegenerate form in
finite dimension, the image of `dμ_x` is the annihilator of the isotropy algebra
(`SmoothTwoForm.IsMomentMap.range_differential`). Separate the level data from the quotient: for any
smooth level, or orbit-type piece of a level, `S ⊆ μ⁻¹(c)` that is supplied with its tangent
description `T_x S`, prove under the hypotheses of that piece the tangent and kernel formula
`ker(i*ω)_x = T_x S ∩ (T_x S)^ω`, its value `ker dμ_x ∩ 𝔤 · x = 𝔤_c · x` when `T_x S = ker dμ_x` (by
equivariance, `dμ_x(ξ_M(x)) = ξ · c`), the corresponding value for each orbit-type description, and that `i*ω` is invariant under the stabilizer `G_c` of `c` and vanishes
on its orbit directions, hence is basic (Tau Ceti's `RoughForm.IsBasic`) for the orbit projection.
The free regular branch, the locally free branch and the singular orbit-type branch instantiate this
data separately.

*Needs:* Layer 1; Tau Ceti `SmoothTwoForm.IsMomentMap.differential`, `IsMomentMap.ker_differential`,
`IsMomentMap.range_differential`, `RoughForm.IsBasic`.

**Checks.**
- For the circle acting on `ℂ` with `μ = −½|z|²` (Layer 1's Example) and `c = −½`, the level is the unit
  circle, `T_x S = 𝔤 · x`, and `i*ω = 0`: the kernel is all of `T_x S`, equal to `𝔤_c · x`.

### 3.0a Regular reduction and the descended form

Let `c ∈ 𝔤*` be a regular value of `μ`, `Z = μ⁻¹(c)`, and `G_c` the coadjoint stabilizer of `c`, and
assume that `G_c` acts freely and properly on `Z`. Give `Z` Tau Ceti's regular-level manifold
structure (`TauCeti.regularLevelChartedSpace`, `TauCeti.isManifold_regularLevel`), with tangent space
`ker dμ` (`TauCeti.range_mfderiv_coe_regularLevel`) and its smooth embedding into `M`
(`TauCeti.isSmoothEmbedding_coe_regularLevel`). Construct the quotient `Q = Z / G_c`, the principal
bundle `π : Z → Q` and the inclusion `i : Z → M` by SmoothBundlesConnections §B1.4's free proper quotient
theorem, using the principal right action `z · g = g⁻¹ z` of its conversion. Prove that freeness of the
`G_c`-action implies regularity of `μ` at every point of `Z` (equivariance gives `G_x ⊆ G_c`, so
`G_x = 1`, `𝔤_x = 0` by §1.1, and `dμ_x` is onto by `SmoothTwoForm.IsMomentMap.differential_surjective_iff`),
while keeping the explicit regular-value hypothesis in the statement of the quotient construction.
Compute `T_x Z = ker dμ_x = (𝔤 · x)^ω` and `ker (i*ω)_x = 𝔤_c · x`. Prove that there is a unique smooth
symplectic form `ω_red` on `Q` with `π* ω_red = i* ω` (the Marsden–Weinstein–Meyer theorem: Meinrenken,
Theorem 8.3 with Remark 8.4, p. 101, at this generality; Cannas da Silva, Theorem 23.1, p. 141, is the
case of a compact group at `c = 0`): by §3.0 the form `i*ω` is closed and basic with kernel
exactly `ker dπ`, so Tau Ceti's `SmoothForm.descendedForm` applies, with uniqueness from
`SmoothForm.eq_descendedForm_iff` and symplecticity from `SmoothTwoForm.isSymplectic_descendedForm_iff`.
The reduced dimension is `dim Q = dim M − dim 𝔤 − dim 𝔤_c`; at a coadjoint-fixed `c` it is
`dim M − 2 dim G`. A level `Z` at a value `c` that is not coadjoint-fixed need not be coisotropic.

*Needs:* §1.1, §3.0; SmoothBundlesConnections §B1.4 (the free proper quotient theorem and its principal bundle); Tau Ceti
`TauCeti.regularLevelChartedSpace`, `TauCeti.isManifold_regularLevel`,
`TauCeti.range_mfderiv_coe_regularLevel`, `TauCeti.isSmoothEmbedding_coe_regularLevel`,
`IsMomentMap.differential_surjective_iff`, `IsMomentMap.ker_differential`, `SmoothForm.descendedForm`,
`SmoothForm.eq_descendedForm_iff`, `SmoothTwoForm.isSymplectic_descendedForm_iff`,
`Lie.isEmbeddedLieSubgroup_stabilizer_coadjointRepresentation`.

**Checks.**
- The circle acting on `ℂⁿ` by `e^(it) z` with `μ(z) = −½|z|²` and `c = −½`: `Z = S^(2n−1)`, the action is
  free, `Q = ℂP^(n−1)` of dimension `2n − 1 − 1 = 2n − 2 = dim M − dim 𝔤 − dim 𝔤_c`. Forgetting the
  quotient by `G_c` would give the odd dimension `2n − 1`, which carries no symplectic form.
- `SO(3)` acting on `T*ℝ³` by the cotangent lift, with `μ(q, p) = q × p` and `c ≠ 0`: `G_c = SO(2)` and
  `dim Q = 6 − 3 − 1 = 2`. The level `Z` has dimension 3 and `TZ^ω = 𝔤 · x` is three-dimensional, but
  `dμ(ξ_M) = ξ × c ≠ 0` for `ξ` not parallel to `c`, so `TZ^ω ⊄ TZ`: the level is not coisotropic.

### 3.0b Orbit reduction and the shifting construction

Give `O = G / G_c` its homogeneous manifold structure (§2.1) and orbit map `ι_O([g]) = Ad*_g c`, an
injective immersion by §2.1; its points are not treated as covectors. Equivariance and the regular-value
hypothesis make `μ` a submersion at every point over `O`, so `μ` is transverse to `ι_O`. Use
SmoothBundlesConnections §B1.0's transverse fibre product to build
`W_O = {(m, o) ∈ M × O | μ(m) = ι_O(o)}` with its smooth structure and its projection to `M`, which is an
injective immersion onto `μ⁻¹(O)`: injectivity of `ι_O` gives injectivity of the set map, injectivity of
`dι_O` the immersion. Define `Y_O = G ×_(G_c) Z` by applying §B1.4's free proper quotient theorem to the
action `h · (g, z) = (g h⁻¹, h · z)` of `G_c` on `G × Z`, whose relation is `(g, z) ∼ (g h, h⁻¹ · z)`; this
quotient atlas, not an associated vector bundle construction, is its smooth structure. Define
`Φ : Y_O → W_O`, `Φ([g, z]) = (g · z, [g])`, and prove that it is a diffeomorphism with inverse
`(m, [g]) ↦ [g, g⁻¹ · m]`. Prove that `k · [g, z] = [kg, z]` is a well-defined, free and proper action of
`G` whose quotient is `Q = Z / G_c`, by identifying the orbit relation and the quotient charts through
§B1.4, and that `Φ` is equivariant for the diagonal action `k · (m, [g]) = (k · m, [kg])` on `W_O`.
Transport the free proper action and the quotient atlas through `Φ`; in particular `W_O / G` carries the
transported structure and `π_W : W_O → W_O / G` is its smooth quotient submersion. On `Y_O` define
`q_Y([g, z]) = [z] ∈ Q`, `i_Y([g, z]) = g · z ∈ M` and `pr_Y([g, z]) = [g] ∈ O`, and prove

`q_Y* ω_red = i_Y* ω − pr_Y* ω_KKS`,

then transport it across `Φ` to `W_O`. Give the quotient diffeomorphism the formula
`e([m, [g]]) = [g⁻¹ · m]`, prove that it is well defined and smooth with smooth inverse, and that
`e ∘ π_W ∘ Φ = q_Y`.

The shifting moment map on `M × O⁻`, where `O⁻` carries `−ω_KKS`, is `Ψ(x, o) = μ(x) − ι_O(o)`. When `O` is
embedded and `μ` is transverse to it, identify the orbit-level manifold with the embedded `μ⁻¹(O)` and
prove that it is coisotropic. Prove that `0` is a regular value of `Ψ`: on its zero set `dμ` is onto by
the regular-value and equivariance hypotheses, hence so is `(v, w) ↦ dμ(v) − dι_O(w)`. Prove that the
regular-fibre atlas of `Ψ⁻¹(0)` and the transverse fibre-product atlas of `W_O` are the same embedded
submanifold atlas, the identity being a diffeomorphism. Under this identification prove that the
zero-level reduction map of `(M × O⁻, Ψ)` is `q_O = e ∘ π_W` and that its descended form satisfies
`q_O* ω_red = pr_M* ω − pr_O* ω_KKS`. This is the shifting construction (Meinrenken, Proposition 8.6,
p. 102; Cannas da Silva, §24.4, pp. 149–150, for compact `G`); the form `ω − μ* ω_KKS` on `μ⁻¹(O)` is
Bates–Lerman, Proposition 11 and the remark after it, p. 10.

*Needs:* §2.1, §2.2, §3.0a; SmoothBundlesConnections §B1.0 (transverse fibre products) and §B1.4;
Tau Ceti `SmoothTwoForm.IsEquivariantMomentMap.neg`, `SmoothTwoForm.IsEquivariantMomentMap.prod`,
`TauCeti.regularLevelChartedSpace`.

**Checks.**
- For `SO(3)` on `T*ℝ³` at `c ≠ 0` (§3.0a's Check), `O` is the sphere of radius `|c|`, `M × O⁻` has
  dimension 8, `Ψ⁻¹(0)` dimension 5 and its quotient by the free `SO(3)`-action dimension 2, equal to
  `dim Z / G_c`.
- For an abelian group the orbit `O = {c}` is a point and `Ψ = μ − c`. For the circle on `ℂⁿ` with
  `μ = −½|z|²` and `c = −½`, `Ψ⁻¹(0)` is the unit sphere. The other sign, `M × O` with `μ + ι_O` (a moment
  map for `ω + ω_KKS`), has zero level `μ⁻¹(−c) = μ⁻¹(½) = ∅`: it reduces at the orbit of `−c`, not of `c`.

### 3.0c Reduced functions, symmetries and reduction in stages

Consume SmoothBundlesConnections §B1.1's descent of invariant smooth maps along a principal quotient,
and specialize it to invariant functions and to commuting symmetries. Prove that `G`-invariant
functions `f`, `h` restrict and descend to `f_red`, `h_red` on `Q` with `{f, h}_red = {f_red, h_red}`, that the flow of
`X_f` preserves `Z` and descends to the flow of `X_(f_red)`, and the compatibility of reduction with
equivariant symplectic maps and with products.

*Quotient groups.* The stages statement needs `G / N` as a Lie group, which no supplier states. For a
closed normal subgroup `N ⊲ G`, give `G / N` the homogeneous manifold structure of §B1.4 and prove that it
is a Lie group whose multiplication and inversion descend by §B1.1, with Lie
algebra `𝔤 / 𝔫` and the projection a Lie group homomorphism and submersion; `N` acts trivially on
`𝔤 / 𝔫`, since `t ↦ n exp(tξ) n⁻¹ exp(−tξ)` lies in `N`.

*Reduction in stages at zero.* Reduce by `N` first: `μ_N = μ|_𝔫` is a group-level moment map for `N`
(§1.2). On `μ_N⁻¹(0)` the moment map `μ` takes values in `𝔫⁰ ≅ (𝔤/𝔫)*` (Mathlib's
`Submodule.dualQuotEquivDualAnnihilator`), and it induces the moment map of the residual `G/N`-action on
`μ_N⁻¹(0) / N`. Assuming that the `N`-stage and the residual stage are regular, free and proper, prove
that the reduction in two stages is symplectomorphic to the direct reduction at zero. For a product
`G = G₁ × G₂` this is Meinrenken, Proposition 8.13, p. 105, and Cannas da Silva, §24.3, p. 149, for
compact connected factors at zero. For a closed normal subgroup, which Cannas da Silva names there as an
extension without proof, the residual level is `μ̄⁻¹(0) = μ⁻¹(0) / N` for the induced moment map `μ̄`, and
the bijection `(μ⁻¹(0) / N) / (G/N) → μ⁻¹(0) / G` carries one reduced form to the other, both pulling
back to the restriction of `ω` to `μ⁻¹(0)`. For a
coadjoint-invariant nonzero `c`, apply this to `μ − c`, with first-stage value `c|_𝔫` and residual value
zero. For a value `c` that is not coadjoint-invariant, first apply the shifting construction of §3.0b on
`M × O_c⁻`, then reduce in stages at zero there and identify the final quotient with `Z / G_c`, with the
regularity, freeness and properness assumptions of each stage spelled out. A subgroup that is not
normal has no residual action, and no stages statement is made for it.

*Needs:* §1.2, §3.0a, §3.0b; SmoothBundlesConnections §B1.1 and §B1.4; Mathlib
`Submodule.dualQuotEquivDualAnnihilator`; Tau Ceti `SmoothTwoForm.poissonBracket`,
`SmoothTwoForm.hamiltonianVectorField`.

**Checks.**
- The left cotangent action of `U(2)` on `T*U(2)` (dimension 8). Reducing by the normal subgroup
  `SU(2)` at zero gives `T*(U(2)/SU(2)) ≅ T*U(1)` (dimension `8 − 2 · 3 = 2`), and reducing that by
  `U(1) = U(2)/SU(2)` at zero gives a point; direct reduction by `U(2)` at zero also gives a point, and the
  tautological forms descend compatibly. Here `U(2)/SU(2) ≅ U(1)` through the determinant, with Lie
  algebra `𝔲(2)/𝔰𝔲(2) ≅ 𝔲(1)` through the trace.
- For the product torus `T² = S¹ × S¹` acting on `ℂ²` factorwise, reduction by the first circle at
  `−½` and then by the second at `−½` gives a point, as does direct reduction by `T²` at `(−½, −½)`.

### 3.0d Quotients by discrete groups

For a discrete group `Γ` acting freely and properly discontinuously by symplectomorphisms on a
Hausdorff, second-countable finite-dimensional symplectic manifold `M`, construct the `MulAction`,
`ContMDiffConstSMul`, `ContinuousConstSMul` and `IsCancelSMul` instances and the `IsManifold`,
Hausdorff and local-compactness instances of the source, and apply Tau Ceti's
`TauCeti.instIsManifoldQuotient` and `TauCeti.isLocalDiffeomorph_quotientMk`. Give `Γ` the discrete
topology and use Mathlib's `properlyDiscontinuousSMul_iff_properSMul`, with
`CompactlyCoherentSpace (M × M)` obtained from first countability, and
`t2Space_quotient_mulAction_of_properSMul` for Hausdorffness of the quotient. Prove that the quotient is
second countable. Tau Ceti's `SmoothForm.descend` descends `ω`, closed (`SmoothForm.isClosed_descend_iff`)
and unique (`SmoothForm.eq_descend_iff`); prove that the descended form is nondegenerate, through the
local diffeomorphism `isLocalDiffeomorph_quotientMk`, so that it is symplectic. These are applications of
the general quotient APIs to the action and the form.

*Needs:* Tau Ceti `TauCeti.instIsManifoldQuotient`, `TauCeti.isLocalDiffeomorph_quotientMk`,
`SmoothForm.descend`, `SmoothForm.isClosed_descend_iff`, `SmoothForm.eq_descend_iff`; Mathlib
`properlyDiscontinuousSMul_iff_properSMul`, `t2Space_quotient_mulAction_of_properSMul`.

**Checks.**
- `ℤ²` acting on `(ℝ², dx ∧ dy)` by translations: the quotient is `T² = (ℝ/ℤ)²` with the descended form of
  area 1. The action of `ℤ/2` by `−1` on `ℝ²` is not free at the origin and is excluded: its quotient is a
  cone, not a manifold.

### 3.0e Locally free levels: the orbifold presentation

Let `G` be compact, `c ∈ 𝔤*`, and suppose `G_c` acts locally freely on `Z = μ⁻¹(c)`. First prove the
smooth level structure: `𝔤_x ⊆ 𝔤_c` by equivariance, local freeness gives `𝔤_x = 0`, and the moment-map
differential identity (`IsMomentMap.differential_surjective_iff`) makes `dμ_x` onto; Tau Ceti's regular
level then gives `Z` (Meinrenken, Theorem 8.2, p. 100: `c` is a regular value exactly when every
stabilizer `G_x`, `x ∈ μ⁻¹(c)`, is discrete). No freeness of the finite stabilizers is imposed.
Consume SmoothBundlesConnections §B1.4's proper-action slices and its finite-isotropy slices with
equivariant transitions, at their locally free scope, with LieGroupoidsPoisson §§G0.0, G3.4 and G3.5's groupoids, restrictions, bibundles
and Morita composition and §B1.0's fibre products. Verify on this `Z` the smooth-level, proper locally
free and finite-isotropy hypotheses of Orbifolds O1.4 and O2, and consume their retained-arrow slice
presentation, the Morita bibundle to the action groupoid `G_c ⋉ Z` and the slice-refinement theorem;
identify the object and arrow charts of this level through the actual `h ∈ G_c` carrying `x` to `y`. This
roadmap owns the restriction of `ω`, its arrow invariance, closedness and nondegeneracy on the resulting
presentation, and the comparison with Orbifolds O4.2. Orbifolds O7 compares these forms and classes with
the other Hamiltonian carriers and does not reconstruct the Morita or refinement theorem. Elements acting
trivially on slices are kept; no free-action quotient theorem is applied to their fixed-point quotients.

Build the basic smooth orbifold chart and gluing application from §B1.4's proper-action slices and from
LieGroupoidsPoisson's Poisson and action data. On the locally free model, descend the level symplectic
form to the slices and prove its arrow compatibility, closedness and nondegeneracy from the shared level
and kernel data of §3.0. Identify it with Orbifolds O4.2's invariant-form carrier and consume that
Morita comparison; the Hamiltonian restriction, the descent and the identification of the model are
this roadmap's. Neither the free manifold reduction of §3.0a nor LieGroupoidsPoisson §G7.2's descent on a
manifold quotient is a premise. ConvexityToric §4.2 consumes this model, with the Orbifolds interfaces,
for effective and ineffective applications. Weighted reduction of `S³`, including weights with a common
factor and generic ineffective isotropy, is part of this section. Cannas da Silva, §24.5, pp. 150–151,
treats a torus at a regular value, whose level has finite stabilizers and an orbifold quotient, and the
weighted circle actions on `ℂ²` with weights `(k, 1)` and coprime `(k, l)`.

*Needs:* §3.0; SmoothBundlesConnections §B1.0 and §B1.4; LieGroupoidsPoisson §§G0.0, G3.4, G3.5;
Orbifolds O1.4, O2, O4.2; Tau Ceti `IsMomentMap.differential_surjective_iff`,
`TauCeti.regularLevelChartedSpace`.

**Checks.**
- The circle acting on `ℂ²` with weights `(p, q)`, `p, q ≥ 1`, `μ = −½ (p|z₁|² + q|z₂|²)` and `c < 0`: the
  level is an ellipsoid `S³`; for coprime `p, q` the stabilizers are `ℤ/p` on `z₂ = 0`, `ℤ/q` on
  `z₁ = 0` and trivial elsewhere, and the quotient is the weighted projective line `ℙ(p, q)`. For
  weights `(2, 2)` every point has stabilizer `ℤ/2`: the isotropy is generically ineffective, and a
  presentation dropping the elements acting trivially on slices would lose it.

### 3.1 Proper-orbit symplectic slice

*Averaging.* First prove the smooth averaging lemma for finite-dimensional tensor bundles over a smooth
`L`-manifold, `L` a compact Lie group, possibly disconnected. Use Tau Ceti's Haar probability measure
`TauCeti.haarProb` and its averaging `TauCeti.haarAverage`. Define the average of a smooth tensor
section by integrating its pulled-back sections; in local bundle frames prove smoothness and
differentiation under the integral from uniform derivative bounds on `L` times compact coordinate
boxes. Prove invariance, commutation with the exterior derivative for forms, and preservation of the
value and of the vanishing of the first jet along an invariant submanifold. This compact Lie group
integration lemma is independent of the finite averaging of Orbifolds O2.4. It is applied below to the
compact stabilizer `H`; for compact `G` it also gives the averaging over compact orbits.

*The model.* Let an arbitrary finite-dimensional Lie group `G`, not necessarily connected, act
smoothly, properly and Hamiltonianly on `M` with group-level moment map `μ`, and fix `p ∈ M`. Put
`ν = μ(p)`, `H = G_p` and `K = G_ν`. Properness makes `H` compact and the orbit `G p ≅ G/H` embedded;
equivariance gives `H ⊆ K`. With `W = T_p(G p)`, identify `W ≅ 𝔤/𝔥` and `W ∩ W^ω ≅ 𝔨/𝔥` through the
moment-map differential and equivariance. Form the symplectic `H`-representation
`V = W^ω / (W ∩ W^ω)`. Average an inner product over `H` and choose `H`-invariant complements
`𝔤 = 𝔥 ⊕ 𝔪 ⊕ 𝔮`, with `𝔪` complementary to `𝔥` in `𝔨` and `𝔮` complementary to `𝔨` in `𝔤`; use these
splittings to include `𝔥*` and `𝔪*` in `𝔤*`. Define `μ_V(v)(ξ) = ½ ω_V(ξ v, v)` for `ξ ∈ 𝔥` and prove
`H`-equivariance and `d μ_V^ξ = ι_(ξ v) ω_V`. No `Ad(G)`-invariant inner product is required.

Construct `Y = G ×_H (𝔪* × V)` for the right action `(g, η, v) · h = (g h, Ad*_(h⁻¹) η, h⁻¹ v)`, using
SmoothBundlesConnections §B1.4's principal quotient charts and §B2.1's associated quotient charts; no
finite-isotropy hypothesis is imposed. On `G × (𝔪* × V)` put `λ = ⟨ν + η + μ_V(v), θ_left⟩`, with
`θ_left` the left Maurer–Cartan form, and `Ω = −dλ + ω_V`. Prove that `Ω` is `H`-basic and descends; the
primitive has `λ(ξ_vertical) = ν(ξ) + μ_V(v)(ξ)` and is not assumed horizontal. For `ξ ∈ 𝔥` the vertical
contraction of `−dλ` is `d μ_V^ξ` and that of `ω_V` is `−d μ_V^ξ`. At `[1, 0, 0]` prove that the descended
tensor is

`Ω((ξ, a, v), (ζ, b, w)) = b(ξ_𝔪) − a(ζ_𝔪) + ν([ξ_𝔮, ζ_𝔮]) + ω_V(v, w)`.

The first summand pairs `𝔪` with `𝔪*`, the `𝔮`-summand is the nondegenerate KKS tensor on `𝔤/𝔨` (§2.2),
and the last is `ω_V`. The coadjoint orbit `G/K` carries its homogeneous structure (§2.1) and may have
only an immersed image in `𝔤*`. Prove nondegeneracy on a `G`-invariant neighbourhood of the zero orbit by
choosing an `H`-invariant fibre neighbourhood at `[1, 0, 0]` and saturating it. Prove that the left
`G`-action has the moment map `μ_Y([g, η, v]) = Ad*_g(ν + η + μ_V(v))`, with `d μ_Y^ξ = ι_(ξ_Y) Ω` and value
`ν` at `[1, 0, 0]`. Closedness, basic descent and nondegeneracy are parts of the model theorem. The
same model and moment map, for a proper action of an arbitrary Lie group, are Bates–Lerman, §2,
pp. 11–13, where `𝔪*` appears as `(𝔤_ν / 𝔥)*`.

*The tubular comparison.* Construct a `G`-equivariant tubular comparison with `M` that matches the full
ambient symplectic tensor along `G p`. Consume §B1.4's proper-action slice and tube theorem and the
associated normal bundle. Using `H`-invariant complements to the radical of `W`, the symplectic normal
quotient `V` and an isotropic dual of the radical, prove the `H`-equivariant presymplectic Witt
extension identifying the model and actual tangent representations and restricting to the prescribed
orbit tangent map; Tau Ceti's `SymplecticForm.exists_isSymplectomorphism_extend` is its
non-equivariant linear form. Choose the invariant inner products and complements by averaging over the
compact `H` and correct the dual complement by the symplectic pairing; symplectic isomorphisms
themselves are not averaged. Extend this linear comparison equivariantly over `G/H` and realize its full
first derivative by a tubular diffeomorphism germ. This roadmap owns the realization of a prescribed
derivative: after the induced normal-bundle isomorphism, the remaining `H`-equivariant tangential shear
lifts through an `H`-invariant complement to `𝔥` in `𝔤`; the resulting `G`-equivariant vector field on the
associated bundle vanishes on the zero orbit and has the required linearization normal to the orbit,
and its time-one flow germ realizes the shear. Prove the local flow, inverse and derivative identities.
Properness, not compactness of the stabilizers alone, supplies the embedded orbit tube used here.

*The equivariant relative Moser argument.* Apply CotangentLagrangian §4.1's tubular fibre-homotopy
construction, with the zero-first-jet primitive of its §4.3, to the difference `Δ` of the pulled-back
forms, which vanishes as a full ambient tensor
along the zero orbit. Fibre scaling `[g, e] ↦ [g, te]` is `G`-equivariant, so the radial homotopy primitive
`β` of the `G`-invariant `Δ` is `G`-invariant and has zero value and zero first jet along the orbit.
Choose an `H`-invariant, fibrewise star-shaped neighbourhood at the identity slice and saturate it by `G`.
Full tensor agreement and compactness of the interpolation interval `[0, 1]` give, after invariant
shrinking, a symplectic affine interpolation there; this uses no compactness of `G p`. Its `G`-invariant
Moser field has zero first jet along the orbit. Prove that its maximal full-time flow domain is open,
`G`-invariant and contains the whole zero orbit, whose trajectories are stationary; the inverse
time-dependent flow gives an open invariant image domain (alternatively, saturate a local full-time
domain at `p` using equivariance and uniqueness). So the time-one map is an equivariant diffeomorphism of
neighbourhood germs, fixes the orbit and has identity ambient differential there. These proper-orbit
flow-domain and relative Moser statements are targets here; CotangentLagrangian §§4.2–4.3's relative
Moser theorems for compact submanifolds are not substituted for them, and no uniform metric radius
around a noncompact orbit or normalized Haar probability on a noncompact `G` is asserted.

*The local normal form.* The resulting equivariant symplectomorphism intertwines `μ` and `μ_Y`: their
difference has zero differential in every Lie-algebra component and vanishes at every point of the zero
orbit by equivariance and the normalization; choose the fibre neighbourhoods so that every component
meets that orbit. The theorem covers disconnected compact `G`, with the compact-orbit averaging proof as
a special case, and proper actions of noncompact groups with arbitrary compact stabilizers. It is a
finite-dimensional proper-action theorem; nothing is extrapolated to infinite-dimensional gauge
groups. Bates–Lerman prove it by the equivariant constant-rank embedding theorem (Theorem 9 and
Corollary 10, p. 9) and the splitting of `T_p M` (Proposition 11 and Corollary 12, pp. 10–11).

*Needs:* §1.1, §2.1, §2.2, §3.0; SmoothBundlesConnections §B1.4 (proper slices and tubes, homogeneous
quotients) and §B2.1 (associated bundles); CotangentLagrangian §4.1 and §4.3 (tubular fibre-homotopy
primitive with zero first jet);
Tau Ceti `TauCeti.haarProb`, `TauCeti.haarAverage`, `SymplecticForm.exists_isSymplectomorphism_extend`,
`IsMomentMap.ker_differential`.

**Checks.**
- For trivial `H` and `ν = 0`, `K = G`, `𝔪 = 𝔤`, `𝔮 = 0`, `V = 0`: `Y = G × 𝔤*` with `λ = ⟨η, θ_left⟩`, and at
  `(1, 0)`, for left-invariant extensions, `dλ((ξ, a), (ζ, b)) = a(ζ) − b(ξ) − η([ξ, ζ]) = a(ζ) − b(ξ)`, so
  `Ω = −dλ` gives `b(ξ) − a(ζ)`, the first summand. For `ν ≠ 0` the term `⟨ν, θ_left⟩` contributes
  `−dλ(ξ, ζ) = ν([ξ, ζ])`, the KKS sign of §2.2.
- At a fixed point `p` of a compact `G` (`H = K = G`, `𝔪 = 𝔮 = 0`), `Y = V` and `μ_Y = ν + μ_V`: the quadratic
  model. For the circle acting on `V = ℂ` by `e^(it)`, `μ_V(z) = ½ ω(iz, z) = −½|z|²`, as in Layer 1's
  Example.

### 3.2 Singular and locally free applications

Instantiate the local form of §3.1 at torus orbits, at fixed points and at central and zero moment
values, with their actual `H`, `K` and `V`. The fixed-point case gives the quadratic weight model of a
torus; general orbits keep the `𝔪*` and coadjoint directions. For a proper action of a Lie group `G`
and a coadjoint orbit `O` that is locally closed in `𝔤*`, construct the orbit-type pieces of `μ⁻¹(O)`
and the strata of the singular reduced space `μ⁻¹(O) / G` from this model, with
their descended symplectic forms (§3.0) and their frontier and Poisson compatibility, and prove the
stratified charts and gluing without a smooth manifold structure on the whole singular quotient
(Bates–Lerman, Theorem 7, Corollary 14 and Theorem 15, pp. 8–15); compact `G` at `O = {0}` is the
special case. The shifting construction of §3.0b, reducing `M × O⁻` at zero, is another route when
`O ≠ {0}`; local closedness of `O` is what identifies its zero level with `μ⁻¹(O)` (Bates–Lerman,
p. 8). The locally free application with finite
isotropy uses the Orbifolds interfaces of §3.0e. The free proper reduction theorems of §3.0a–§3.0c
and the Fréchet and Sobolev hypotheses of Layer 5 keep their own scope.

*Needs:* §3.0, §3.0b, §3.0e, §3.1; Orbifolds O1.4, O2.

**Checks.**
- The circle acting on `ℂ²` by `e^(it)(z₁, z₂)` with `μ = −½(|z₁|² + |z₂|²)` at the singular value `0`: the
  level is the origin, a single orbit-type piece, and the reduced space is a point; at `c < 0` it is
  `ℂP¹`. For the action with weights `(1, −1)`, `μ = −½(|z₁|² − |z₂|²)`, the zero level is a cone whose
  reduced space is the stratified space `ℂ` with strata the origin and `ℂ ∖ {0}`, the origin coming from the
  fixed point with the quadratic weight model.

### Examples

- The weighted projective line `ℙ(p, q)` (§3.0e) and reduction in stages for the product torus (§3.0c)
  are the standard tests of this layer; every quotient test checks the pulled-back form, not only the
  dimension or a bijection of sets.
- The nonabelian stages test on `T*U(2)` (§3.0c) compares with direct `U(2)` reduction at zero, including
  the descent of the tautological form.

### Dependencies

Layers 1 and 2. SmoothBundlesConnections §§B1.0, B1.1, B1.4, B2.1. LieGroupoidsPoisson §§G0.0, G3.4,
G3.5. Orbifolds O1.4, O2, O4.2. CotangentLagrangian §§4.1, 4.3. Tau Ceti: regular levels, form descent
along submersions and along discrete quotients, discrete quotient manifolds, Haar averaging, linear Witt
extension. Mathlib: `Submodule.dualQuotEquivDualAnnihilator`, proper actions of discrete groups.

## Layer 4: cotangent and groupoid reduction

### 4.1 Cotangent reduction

Let a Lie group `G` act freely and properly on `Q`, with the cotangent-lifted action on `T*Q`, its
canonical form `ω_can = −dλ` and the moment map `μ(q, p)(ξ) = p(ξ_Q(q))` (Tau Ceti's
`CotangentBundle.symplecticForm` and `CotangentBundle.isEquivariantMomentMap_momentMap`). The three
statements below are Ortega–Ratiu, *Cotangent bundle reduction*, pp. 1–3: reduction at zero, the
embedding version with its magnetic term, which is onto exactly when `𝔤_c = 𝔤`, and the fibration
version (also Meinrenken, Example 8.9, p. 103, at zero). Their left connection `A_left` with
`A_left(ξ_Q^left) = ξ` is `−A`, so their map `p ↦ p − ⟨c, A_left⟩` is the shift below and their form
`Ω_(Q/G) − B_c` is `ω_can + pr* β_c`. Use SmoothBundlesConnections
§B3.1's principal connections, §B2.5's adjoint bundle and §B4.1's curvature and change-of-connection
formulas, for the standard principal right action `q · g = g⁻¹ q` and connection forms with
`A(ξ_Q^right) = ξ`, hence `A(ξ_Q^left) = −ξ`.

- *Zero level.* Prove `T*Q //₀ G ≅ T*(Q/G)`: the zero level `μ⁻¹(0)` is the bundle of covectors
  annihilating the orbit directions (the horizontal covectors), its quotient by `G` is identified with
  `T*(Q/G)` through the quotient map, the tautological form descends to the tautological form of
  `T*(Q/G)`, and `dim = 2(dim Q − dim G)`.
- *Invariant nonzero values: the magnetic model.* For a coadjoint-invariant `c ∈ 𝔤*` and a principal
  connection `A`, the map `μ⁻¹(c) → μ⁻¹(0)`, `p ↦ p + ⟨c, A_q⟩`, is a `G`-equivariant diffeomorphism onto
  the horizontal covectors. Prove that it identifies `T*Q //_c G` with `T*(Q/G)` carrying
  `ω_red = ω_can + pr* β_c`, where `β_c` is the two-form on `Q/G` with `π* β_c = ⟨c, F_A⟩`. Prove that
  changing the connection changes `β_c` by an exact form and the identification by the corresponding
  fibre translation.
- *Values that are not coadjoint-invariant.* Build the associated coadjoint-orbit bundle
  `Q ×_G O_c → Q/G`, pulled back to `T*(Q/G)`, with its Sternberg form, and identify the reduced space with
  it through §3.0b's orbit model, rather than with a plain cotangent bundle.

*Needs:* §3.0a, §3.0b; SmoothBundlesConnections §B1.4, §B2.1, §B2.5, §B3.1, §B4.1; Tau Ceti
`TauCeti.CotangentBundle`, `CotangentBundle.liouvilleForm`, `CotangentBundle.symplecticForm`,
`CotangentBundle.momentMap`, `CotangentBundle.isEquivariantMomentMap_momentMap`,
`CotangentBundle.mpullback_smul_liouvilleForm`; Tau Ceti's fibrewise translation by a one-form
(`TauCeti/Geometry/Symplectic/Cotangent/Bundle/Fiberwise.lean`).

**Checks.**
- For the left action `q · g = g⁻¹ q`, the right fundamental field is `ξ^right(q) = d/dt exp(−tξ) q = −ξ^left(q)`,
  so `A(ξ^left) = −ξ`; then `(p + ⟨c, A_q⟩)(ξ^left(q)) = c(ξ) − c(ξ) = 0` for `p ∈ μ⁻¹(c)`, so the shift lands
  in the horizontal covectors. The opposite shift `p − ⟨c, A_q⟩` would land in `μ⁻¹(2c)`.
- Translation by the one-form `α = ⟨c, A⟩` pulls `ω_can` back to `ω_can − π* dα`, and for invariant `c`,
  `⟨c, F_A⟩ = d⟨c, A⟩` because `c` vanishes on `[𝔤, 𝔤]`; this gives the sign `+ pr* β_c`.
- `G` acting on itself: `T*G //₀ G` is a point. The circle acting on `S³` by the Hopf action at `c ≠ 0`:
  `β_c` is `c` times the curvature of the Hopf connection, whose integral over `S²` is nonzero, so the
  magnetic term is not exact.

### 4.2 Groupoid reduction

Use LieGroupoidsPoisson's cotangent groupoid `T*G ⇉ 𝔤*` of §G6.3, left-trivialized with
`s(g, ν) = ν` and `t(g, ν) = Ad*_g ν` where `Ad*_g ν = ν ∘ Ad_(g⁻¹)`, with the positive Lie–Poisson
structure `{ℓ_ξ, ℓ_η} = ℓ_([ξ, η])` of §G4.6A, its composable multiplication and its multiplicative form.
Consume §G7.2's isotropy quotient of a level and its descended form, §G7.3's description of a
Hamiltonian action as a cotangent-groupoid action with its regular-value identifications, and §G7.4's
identification of the action groupoid `G ⋉ O` with the restriction `(T*G)|_O`, under §G7.2's
regular-value and free proper isotropy-action hypotheses. With the orbit model `W_O`, `Φ` and `e` of
§3.0b, prove that reduction at `ν` by the groupoid isotropy recovers reduction by `G_ν`: construct the
final quotient diffeomorphism and prove that §G7.2's descended form agrees with the reduced form of
§3.0a. The abstract restriction and action groupoids and their smoothness are LieGroupoidsPoisson's;
the generic descent of forms along submersions is Tau Ceti's (`SmoothForm.descendedForm`) and is not
repeated.

*Needs:* §3.0a, §3.0b; LieGroupoidsPoisson §G4.6A, §G6.3, §G7.2, §G7.3, §G7.4; Tau Ceti
`SmoothForm.descendedForm`.

**Checks.**
- `SO(3)` acting on `T*ℝ³` at `ν ≠ 0`: the groupoid orbit of `ν` is the sphere `O` of radius `|ν|`, its
  isotropy is `G_ν = SO(2)`, and groupoid reduction gives `μ⁻¹(O)/G ≅ μ⁻¹(ν)/G_ν`, of dimension
  `5 − 3 = 2`. The naive quotient `μ⁻¹(ν)/G` is not defined, since `μ⁻¹(ν)` is not `SO(3)`-invariant
  for `ν ≠ 0`: the isotropy is what makes the comparison correct.

### Examples

- `T*ℝⁿ` with `ℝ` acting by translation along `e₁`: `T*ℝⁿ //₀ ℝ = T*ℝ^(n−1)`.
- The zero cotangent quotient and the nonabelian `T*U(2)` stages test of §3.0c.

### Dependencies

Layer 3 (§3.0a, §3.0b). SmoothBundlesConnections §§B1.4, B2.1, B2.5, B3.1, B4.1. LieGroupoidsPoisson
§§G4.6A, G6.3, G7.2–G7.4. Tau Ceti: cotangent bundles, Liouville and canonical forms, cotangent lifts and
their moment maps, fibrewise translations, form descent along submersions.

## Layer 5: gauge actions over a surface

Throughout, `Σ` is a closed connected oriented smooth surface of genus `g`, `K` a compact Lie group with
a fixed positive-definite `Ad`-invariant inner product `B` on `𝔨`, and `P → Σ` a smooth principal
`K`-bundle. The finite-dimensional reduction theorems of Layer 3 are not applied unchanged to the
infinite-dimensional space of connections; every statement here carries its own Fréchet or Sobolev
hypotheses. The symplectic form and the curvature moment map of §5.1 are Atiyah and Bott's
(Meinrenken, Theorem 7.46, p. 98, for the trivial bundle, with the gauge action of §5.1; Cannas da
Silva, §§25.3–25.4, pp. 158–159, for a principal bundle).

### 5.1 The affine space of connections and its moment map

Consume SmoothBundlesConnections §B2.5's adjoint bundle `ad P` and invariant pairings, §B3.1's affine
space of principal connections, §B4.1's curvature identities and §B4.2's gauge group. Let `𝒜(P)` be
the affine space of smooth connections on `P`, with tangent space `Ω¹(Σ, ad P)`. On this smooth affine
Fréchet space express every derivative by explicit directional formulas, not by `mfderiv` on a
fictitious Banach manifold. Construct `Ω_A(a, b) = ∫_Σ B(a ∧ b)`, and prove from those formulas that it is
weakly nondegenerate and closed. Define the affine smooth gauge action with the left convention
`g · A = g A g⁻¹ − (dg) g⁻¹`, so that the infinitesimal generator of `ξ ∈ Ω⁰(Σ, ad P)` is `ξ_A = −d_A ξ`, and
the curvature pairing `⟨μ(A), ξ⟩ = ∫_Σ B(F_A, ξ)`. Prove `ι_(ξ_A) Ω = dμ_ξ` through the integration by
parts identity on the closed surface, and equivariance. The zero level of the curvature is the flat
level. Tau Ceti's Hamiltonian API on manifolds modelled on normed spaces is used only after a
compatible Sobolev model and its smoothness are established (§5.2).

*Needs:* SmoothBundlesConnections §B2.5, §B3.1, §B4.1, §B4.2; DifferentialGeometry Layer 5
(integration and Stokes' theorem).

**Checks.**
- For `g_t = exp(tξ)`, `d/dt|₀ (g_t A g_t⁻¹ − (dg_t) g_t⁻¹) = [ξ, A] − dξ = −d_A ξ`.
- `dμ_ξ(a) = ∫ B(d_A a, ξ) = ∫ B(a ∧ d_A ξ)` by `d B(a, ξ) = B(d_A a, ξ) − B(a ∧ d_A ξ)` and Stokes, and
  `Ω(ξ_A, a) = ∫ B(−d_A ξ ∧ a) = ∫ B(a ∧ d_A ξ)`: the two sides agree. With the right convention
  `g · A = g⁻¹ A g + g⁻¹ dg` the generator is `+d_A ξ` and the moment map changes sign.

### 5.2 Sobolev completions and the Coulomb slice

Use ComplexKahlerGeometry §5.4's carrier `BundleSobolev E s` with its localization, Hilbert-space and
real–complex comparisons, and §5.7's smooth-coefficient bundle Laplace and regularity estimates; PDE
Layers 4–5 supply the scalar estimates on domains. Construct connections of class `H^s` and gauge
transformations of class `H^(s+1)` for every real `s > 1` on the closed surface. Prove the
multiplication and composition estimates and the smooth gauge-chart estimates for these orders, the
first-order consequences of the smooth-reference Hodge and Laplace estimates, and the perturbation to
rough coefficients. For `A ∈ H^s` its difference from a smooth reference is of class `H^s` and its weak
derivative of class `H^(s−1)`. Prove boundedness and continuous dependence of
`d_A + d_A* : H^s → H^(s−1)` and `d_A* d_A : H^(s+1) → H^(s−1)`, the Fredholm property and compact
lower-order comparison through the multiplication and Rellich estimates, and the implicit-function
theorem for the Coulomb slice on complements to the stabilizer (Huebschmann, §2, p. 8, uses this slice
`A + ker d_A*` at a central Yang–Mills connection `A`, with the orthogonal splitting
`Ω¹(Σ, ad P) = im d_A ⊕ ker d_A*`, and takes its Sobolev slice property as standard). The
globalization over smooth bundles is
ComplexKahlerGeometry's; the rough coefficients and these gauge applications are targets here.

*Needs:* §5.1; ComplexKahlerGeometry §5.4 and §5.7; PDE Layers 4–5.

**Checks.**
- In dimension two, `H^s` is an algebra for `s > 1` (Sobolev embedding into continuous functions); at
  `s = 1` it is not, and the multiplication estimate fails, which is why `s > 1` is required.

### 5.3 Regularity of weak flat connections and gauges

In a controlled slice relative to a smooth `A₀`, write `A = A₀ + a` with `d_(A₀)* a = 0` and
`d_(A₀) a = −F_(A₀) − ½[a ∧ a]`. Since `H^s` is an algebra in dimension two for `s > 1`, the
smooth-reference first-order elliptic estimates gain a derivative and iterate to smoothness. For an
arbitrary weakly flat `A`, construct local rough gauges by rescaling small coordinate discs to a fixed
disc, extending by a cutoff into a fixed auxiliary round sphere, and solving the small `H^s` Coulomb
equation there, using the mean-zero scalar Laplace inverse obtained from ComplexKahlerGeometry §5.7's
compact Green operator and the gauge-exponential implicit-function theorem. In the integer Sobolev
scale, a `W^(1,q)` connection on the unit disc whose curvature is small in `L^(s₀)`, `s₀ > 1`, has a
`W^(2,q)` gauge into Coulomb gauge with a Neumann boundary condition (Feehan, Theorem 2.3, p. 18,
restating Uhlenbeck's theorem). On the fixed connected
sphere prove that `ker Δ` consists of the constants by the energy identity for the nonnegative scalar
`Δ = d* d`, identify its geometric `L²` complement with the mean-zero functions, and use the regularity in
all real orders to obtain the bounded inverse `H^(s−1)_0 → H^(s+1)_0`, tensored with the finite real Lie
algebra. Prove the cutoff and scaling bound and uniform smallness on each stated bounded sector. The
cutoff extension may have curvature away from the inner discs: use the flat equation and bootstrap only
on the inner discs, where it agrees with the original field. The transition gauges satisfy the weak
first-order gauge equation and become smooth, defining a smooth bundle `P′` with its `H^(s+1)`
isomorphism `F : P → P′`. Construct a smooth comparison `S : P → P′` in the same bundle class by finite
bundle-chart approximation of sections of the bundle of equivariant fibre isomorphisms and a fibrewise
tubular retraction, proving transition equivariance. Transport through `F` and `S` to obtain the
`H^(s+1)` gauge on the original `P` and its smooth representative connection. Prove common chart radii,
bounds and continuous or parameter choices on each declared `H^s` neighbourhood or compact family,
including the comparison choices; smoothing each connection individually does not establish the
quotient topology. These local estimates supply the controlled neighbourhoods before the bootstrap;
smooth approximation alone does not control a slice radius that depends on the reference. A weak
`H^(s+1)` gauge between smooth connections satisfies its local first-order equation and bootstraps to a
smooth gauge; prove the composition of bundles and gauges throughout.

*Needs:* §5.2; ComplexKahlerGeometry §5.7 (compact Green operator, all-order regularity);
GeometricTopology §1.5 (tubular neighbourhoods).

**Checks.**
- On the round `S²` the scalar Laplacian `Δ = d* d` has `⟨Δf, f⟩ = ‖df‖² ≥ 0`, so `Δf = 0` forces `df = 0` and
  `f` constant; on the mean-zero functions it is invertible. On a disconnected sphere pair the kernel
  would be two-dimensional, which is why a fixed connected sphere is used.

### 5.4 The flat quotients and holonomy

Define both quotients explicitly: smooth flat connections on the fixed `P` modulo smooth gauge, and
weakly flat `H^s` connections modulo `H^(s+1)` gauge, each in a based version (gauge fixing a point of `P`
over a base point of `Σ`) and an unbased version. The regularity of §5.3 gives their groupoid and set
comparison; prove the topological and stratified comparison using continuous slices and uniform
higher-order flat estimates, so that `H^s` convergence after slice gauges gives convergence in every
smooth seminorm. Holonomy is continuous for these connections, by `H^s ⊆ C⁰` and the path equation with
its gauge covariance; compare it with SmoothBundlesConnections §B5.2's smooth holonomy. Obtain the
homeomorphism of the full quotient with the locus of `Hom(π₁Σ, K)/K` whose associated flat bundle has the
topological class of `P`, including all reducible connections and stabilizers, and the corresponding
framed (based) space (for smooth connections on a bundle that admits a flat one, Huebschmann, part II,
Theorem 2.3 and Lemma 2.4, p. 6, which match stabilizers). Prove the local slice (Kuranishi) and
orbit-type comparisons; a bijection of sets
alone is not enough.

*Needs:* §5.3; SmoothBundlesConnections §B5.2 (holonomy and flat connections).

**Checks.**
- For `K = U(1)` and `P` trivial over the torus `T²`, the flat connections modulo gauge are
  `Hom(ℤ², U(1)) = U(1)²`, a two-torus, and `π₁T² = ℤ²` is abelian so conjugation is trivial.

### 5.5 The deformation complex

Construct the adjoint flat local system from SmoothBundlesConnections' parallel transport and prove its
de Rham and local-system comparison on the surface, using local parallel frames, DifferentialGeometry's
local Poincaré lemma and integration and the finite cochain comparison of AlgebraicTopology §6.1.
Identify wedge, `B` and integration with the cup product and evaluation of local systems.
AlgebraicTopology §6.4's twisted Poincaré duality for oriented surfaces then gives
`H²_A(Σ; ad P) ≃ H⁰_A(Σ; ad P)*` and the nondegenerate alternating pairing on `H¹_A` (Huebschmann, §1.2,
(1.2.3), p. 5). Prove the Euler formula
`dim H¹_A = (2g − 2) dim 𝔨 + 2 dim H⁰_A`. These are statements about the full deformation complex;
quotienting the gauge group by an ineffective subgroup does not delete any cohomology summand.

*Needs:* §5.1; SmoothBundlesConnections §B5.2; DifferentialGeometry §6.2 (local Poincaré lemma) and
Layer 5 (integration); AlgebraicTopology §6.1 and §6.4.

**Checks.**
- The Euler characteristic of the deformation complex is `χ(Σ) dim 𝔨 = (2 − 2g) dim 𝔨`, and with
  `dim H² = dim H⁰` this gives `dim H¹_A = 2 dim H⁰_A + (2g − 2) dim 𝔨`. For `U(1)` this is `2g`; for an
  irreducible `SO(3)` connection, `H⁰_A = 0` and `dim H¹_A = 6g − 6`.

### 5.6 The centre, its local system and the central-curvature level

For the full compact `K`, possibly disconnected, construct the `Ad(K)`-invariant orthogonal splitting
`𝔨 = 𝔷 ⊕ 𝔨_ss` with `𝔨_ss = [𝔨, 𝔨]` and its associated bundles. Conjugation on `𝔷` factors through `π₀K`, so
`𝔷_P = P ×_Ad 𝔷` is a canonical flat local system, possibly nontrivial: the reflection component of
`O(2)` acts by `−1` on its one-dimensional Lie algebra. Prove `F^𝔷_(A+a) − F^𝔷_A = d^𝔷 a_𝔷`, so that
`[F^𝔷_A] ∈ H²(Σ; 𝔷_P)` depends only on `P`; flat connections require this class to vanish. With a fixed
smooth metric on the surface, identify the central harmonic projection with this fixed class and
restrict the codomain of the curvature to the corresponding affine space of central two-forms, with the
full semisimple component. Its central tangent consists of the exact two-forms, equivalently the
annihilator under integration of the parallel sections `H⁰(𝔷_P)`. This restriction of the codomain
removes the fixed central cokernel; it does not remove `H¹(𝔷_P)`. For a fixed central-curvature level,
choose the harmonic representative `ζ` of the class of the bundle (for connected `K`, whose centre has
Lie algebra `𝔷`, it is the constant central curvature `X_P ⊗ vol_Σ` of every central Yang–Mills
connection, `X_P ∈ 𝔷` being fixed by the topology of `P`: Huebschmann, §1.2, p. 5) and prove that the
full gauge group
preserves it: the component action on `𝔷_P` is parallel and `B`-orthogonal, hence commutes with the Hodge
projection, and equivariance of the curvature and independence of the class from `A` imply that the
action fixes the class and hence its unique harmonic representative. Keep these equations for the
disconnected components as well. Prove these statements and their Sobolev comparisons rather than
replacing the full complex by a trace-free one without accounting for its central variables.

*Needs:* §5.1, §5.5; LieGroups Layer 5A (the splitting `𝔨 = 𝔷 ⊕ [𝔨, 𝔨]` for the identity component `K⁰`;
its `Ad(K)`-invariance for disconnected `K` is proved here); SmoothBundlesConnections §B2.5.

**Checks.**
- For `K = O(2)`, `𝔷 = 𝔬(2) = ℝ` (the group is not connected but its Lie algebra is abelian) and a reflection
  acts by `−1`; over a surface whose `O(2)`-bundle has nontrivial orientation character, `𝔷_P` is the
  corresponding nontrivial real line local system, with `H⁰(𝔷_P) = 0`.

### 5.7 The ineffective kernel

Define the global ineffective kernel `I_P = ker(Gauge(P) → Aut(𝒜(P)))`. Prove
`C = ker(Ad : K → Aut(𝔨)) = C_K(K⁰)` and identify `I_P` with the parallel sections of the canonical flat
group bundle `P ×_conj C`, whose transition action factors through `π₀K`: varying `A` forces `Ad_u = Id`
pointwise, and the remaining gauge equation forces the local `C`-valued section to be constant; prove the
converse. Evaluation identifies `I_P` with a closed subgroup of a fibre `C`, so it is compact and normal,
with `Lie(I_P) = H⁰(𝔷_P)`. It need not be central in the full gauge group. For connected `K` it is the
constant `Z(K)`; for finite `K` it is the whole gauge group. Keep the point stabilizer of a particular
flat `A` separate: it is the group of parallel sections of the adjoint group bundle, equivalently the
centralizer of the holonomy; its Lie algebra is `H⁰_A(ad P)` (Huebschmann, §1.2, p. 5), and its
quotient by `I_P` has Lie algebra
`H⁰_A(𝔨_ss, P)`.

*Needs:* §5.4, §5.6; SmoothBundlesConnections §B4.2, §B5.2.

**Checks.**
- For `K = O(2)`, `C = C_K(SO(2)) = SO(2)`: a reflection inverts rotations, so it is not in `C`.
- For finite `K`, `𝔨 = 0`, `C = K` and `𝒜(P)` is a single point, so every gauge transformation acts trivially.

### 5.8 The finite-dimensional local symplectic model

At a flat `A`, and at the specified fixed central-curvature level (§5.6), construct a
finite-dimensional, `Stab(A)`-invariant symplectic thickening inside the Coulomb slice. Identify its
restricted form with the cup-product and integration pairing of the surface under the Kuranishi
coordinates. Prove that the harmonic part of the residual curvature, shifted by the fixed central level
and paired with `H⁰_A` through surface duality, is its equivariant moment map. Compare its zero-level
stabilizer quotient with the local gauge quotient, preserving stabilizer types and the descended forms
on every orbit-type stratum, and keep the full stabilizer and its ineffective kernel. This gives the
finite-dimensional Hamiltonian presentation to which §3.2 applies, with §3.1 supplying its quadratic
tangent model. Follow Huebschmann, §§2.18–2.32, for this construction, and prove the stated
comparisons, including their transport from Sobolev to smooth connections.

*Needs:* §5.3–§5.7; §3.1, §3.2.

**Checks.**
- For `K = U(1)` and any flat `A`: `H⁰_A = ℝ`, `H¹_A = H¹(Σ; ℝ)` of dimension `2g` with the cup-product
  form, the moment map takes values in `(H⁰_A)* ≅ ℝ` and is the central curvature, constant at the fixed
  level, and the stabilizer `U(1)` is the ineffective kernel and acts trivially. The thickening is a
  `2g`-dimensional symplectic chart of the moduli torus of §5.10; a model dropping the `H⁰` terms would
  predict dimension `2g − 2`, the value of `(2g − 2) dim 𝔨` alone.

### 5.9 The regular semisimple locus

On the locus `H⁰_A(𝔨_ss, P) = 0`, prove regularity of the curvature into the restricted codomain of §5.6,
the local proper slice comparison and the resulting finite-dimensional symplectic local model. The full
slice tangent is `H¹_A(ad P)` with its cup-product and integration form. The residual stabilizer
`Stab(A)/I_P` is compact with zero Lie algebra, hence finite. A trivial residual action gives a manifold
chart (Huebschmann, Theorem 2.33, p. 13, for a stabilizer acting trivially on `H¹_A`); otherwise keep
the finite group action, including any further ineffective elements, in the
orbifold presentation. If the effective residual action is trivial, identify its coarse chart as a
manifold even when the presentation keeps ineffective isotropy. At positive-dimensional effective
stabilizers use the slice and Kuranishi construction of singular strata, not the regular theorem. On
this regular semisimple locus the dimension is `(2g − 2) dim 𝔨 + 2 dim H⁰(𝔷_P)`, which is
`(2g − 2) dim 𝔨 + 2 dim 𝔷` for connected `K`. A tangent space of a coarse singular quotient is not
identified with `H¹` without the local smoothness hypotheses.

*Needs:* §5.5–§5.8; §3.0e.

**Checks.**
- For `U(1)` and `g ≥ 1`, `𝔨_ss = 0`, so every flat connection is in the locus, and the dimension is
  `(2g − 2) + 2 = 2g`.

### 5.10 The framed quotient and the tests

For the framed (based) flat quotient fix a point of `P` over the base point of `Σ`, and compare its
deformation tangent with the cocycles `Z¹(π₁Σ; 𝔨_(Ad ρ))`. Construct the exact sequence
`0 → 𝔨 / H⁰_A(ad P) → Z¹ → H¹_A(ad P) → 0`, including the evaluation identification of parallel sections
and the comparison of de Rham and group cohomology in degree one. On a smooth unobstructed framed locus
its dimension is `dim H¹_A + dim 𝔨 − dim H⁰_A = (2g − 1) dim 𝔨 + dim H⁰_A`. A based gauge transformation
fixing a connection and the chosen point is the identity (Huebschmann, §2, p. 8), but freeness alone does
not make the flat level
regular at reducible connections; the framed quotient has no automatic symplectic structure.

The following are targets of this layer.

- *`U(1)` over every closed oriented surface.* For a degree-zero `U(1)`-bundle, verify that the unbased
  moduli space is the torus `H¹(Σ; ℝ) / (2π H¹(Σ; ℤ))` of dimension `2g`, with `H⁰ = H² = ℝ` and the
  constant `U(1)` as ineffective kernel; this shows directly that the full `H²` need not vanish. The torus
  `T²` is the case `g = 1`.
- *Nonzero degree.* For a `U(n)`-bundle of nonzero degree the flat locus is empty. At its compatible fixed
  central constant-curvature level, fixed by Chern–Weil theory and the degree, the trace-free
  obstruction calculation keeps the central `H¹` unless a determinant connection is specified and fixed
  as additional data. Prove the corresponding local theorem at that central level, whose adjoint
  connection is flat, with regularity on the locus where the trace-free obstruction vanishes and the
  central `H¹` variables kept unless the determinant connection is fixed; use the restricted affine
  codomain of §5.6, and do not assert surjectivity onto the fixed harmonic central component. The
  ordinary correspondence between flat connections and `K`-holonomy is not used for nonzero curvature.
- *`SO(3)` in the class `w₂ ≠ 0`.* For `g ≥ 2`, the irreducible flat `SO(3)`-connections on the bundle with
  `w₂ ≠ 0` form a space of dimension `6g − 6`, verified with the stabilizer checks of §5.7 and §5.9 and
  without assuming that every such connection has trivial finite stabilizer.
- *Disconnected and finite groups.* The `O(2)` centre local system (§5.6) and the ineffective kernel of a
  finite group (§5.7).

No finite-dimensional free proper reduction theorem is applied unchanged to the full Fréchet space of
connections.

*Needs:* §5.4–§5.9; AlgebraicTopology §6.1 (group cohomology and local systems).

**Checks.**
- The framed dimension: `dim H¹_A + dim 𝔨 − dim H⁰_A = (2g − 2) dim 𝔨 + 2 dim H⁰_A + dim 𝔨 − dim H⁰_A =
  (2g − 1) dim 𝔨 + dim H⁰_A`; for `U(1)` it is `2g`, the dimension of `Hom(π₁Σ, U(1)) = U(1)^(2g)`.
- For `U(1)`, `H¹(Σ; ℝ) ≅ ℝ^(2g)` and the lattice `2π H¹(Σ; ℤ)` corresponds to holonomies `exp(i ∮ a)`, so the
  quotient is `(ℝ/2πℤ)^(2g)`; omitting the factor `2π` would identify connections with different holonomy.

### Examples

- `U(1)` flat connections over every closed oriented surface, including the torus, and the
  `SO(3)`, `U(n)`, `O(2)` and finite-group tests of §5.10.

### Dependencies

Layer 3 (§§3.0e, 3.1, 3.2) for the local model. SmoothBundlesConnections §§B2.5, B3.1, B4.1, B4.2, B5.2.
ComplexKahlerGeometry §§5.4, 5.7. PDE Layers 4–5. DifferentialGeometry §6.2 and Layer 5.
AlgebraicTopology §§6.1, 6.4. GeometricTopology §1.5. LieGroups Layer 5A.

## Downstream consumers

- ConvexityToric: §3.1 consumes the chamber quotient and centralizers of §2.5 for its cross-section and
  convexity theorems; §4.2 consumes the orbifold presentation of §3.0e for reduced classes, effective and
  ineffective; its §1.1 makes the integral refinements of the compact real data of §2.3.
- SchubertGeometry §9.7 compares the Morse cells of §2a.4 with Schubert cells.
- Orbifolds O7 compares the forms and classes of §3.0e with its other Hamiltonian carriers.
- InstantonFloerTheory, YangMillsConnectionsAndCaloricGauge and GaugeQuiltFieldTheory use Layer 5's
  surface quotient, holonomy and Sobolev conventions.
- GeometricQuantization uses Layers 1–3 (group-level moment maps, coadjoint orbits, reduction) and the
  even-cell model of Layer 2a.
- TensorProductCombinatorics uses Layers 1–2 (moment maps, the KKS normalization and the compact
  chamber).
- IntegrableSystems uses the moment maps of Layer 1 and the regular quotients of Layer 3.

## Scope and ownership

**This roadmap owns** the group-level stabilizer, restriction, transport and component statements and
the group-level model actions (Layer 1); the flux homomorphism, the Hamiltonian kernel and the endpoint
quotient, compact and compactly supported, with the torus flux group (Layer 1a); coadjoint orbits as
symplectic manifolds, the comparison of the KKS form with the linear Poisson structure, the coadjoint
chamber classification and the connected centralizers of compact groups, and the model orbits (Layer 2);
the Morse theory of height functions on compact coadjoint orbits (Layer 2a); regular, orbit, staged,
discrete, locally free and singular reduction, the gluing of symplectic forms on the orbifold charts of
locally free levels, and the local normal form (Layer 3); cotangent reduction and its comparison with
groupoid reduction (Layer 4); and the symplectic gauge theory of connections over a closed surface,
including its Sobolev completions, Coulomb slices, regularity, flat quotients, local models and
deformation complex (Layer 5).

**Already in the library.** The following are proved at the Tau Ceti pin and are consumed through the
supplier contracts below; a citation of this roadmap for one of them resolves to these declarations.

| Statement | Declarations at the pin |
|---|---|
| Fundamental vector fields: smoothness, linearity, `[ξ, η]_M = −[ξ_M, η_M]`, the exponential flow, the infinitesimal action | `TauCeti.fundamentalVectorField`, `TauCeti.contMDiff_fundamentalVectorField`, `TauCeti.mlieBracket_fundamentalVectorField`, `TauCeti.isMIntegralCurve_mulInvariantExp_smul_smul`, `TauCeti.InfinitesimalAction.fundamental` |
| Infinitesimal moment maps: restriction along Lie algebra maps, products, negation, constant shifts, transport, uniqueness on connected `M`, the cocycle | `TauCeti.SmoothTwoForm.IsMomentMap` with `.comp`, `.prod`, `.neg`, `.add_const`, `.mpullback`, `.isMomentMap_iff_exists_eq_add`; `TauCeti.SmoothTwoForm.momentCocycle` |
| Group-level moment maps, invariant shifts, integration over connected groups | `TauCeti.SmoothTwoForm.IsEquivariantMomentMap` with `.add_const_iff`, `.isEquivariantMomentMap_iff_exists_eq_add`, `.neg`, `.prod`; `IsMomentMap.isEquivariantMomentMap_of_momentCocycle_eq_zero` |
| The group defect: independence of `x`, cocycle law, derivative equal to the cocycle, coboundaries, affine equivariance | `TauCeti.momentDefect`, `TauCeti.momentDefect_mul`, `TauCeti.momentDefect_add_const`, `IsMomentMap.momentDefect_eq`, `IsMomentMap.momentDefect_mul_eq`, `IsMomentMap.mvfderiv_momentDefect_one`, `IsMomentMap.apply_smul_eq_add_momentDefect` |
| Translation (Heisenberg cocycle) and linear symplectic moment maps, infinitesimally | `TauCeti.SymplecticForm.translationMomentMap`, `TauCeti.SymplecticForm.momentCocycle_translation`, `TauCeti.SymplecticForm.linearMomentMap`, `TauCeti.SymplecticForm.isMomentMap_linearMomentMap` |
| The cotangent lift preserves `λ`, and its moment map is equivariant | `TauCeti.CotangentBundle.mpullback_smul_liouvilleForm`, `TauCeti.CotangentBundle.isEquivariantMomentMap_momentMap` |
| The exact sequence `0 → H⁰_dR → C^∞ → symplectic fields → H¹_dR → 0` | `TauCeti.SmoothTwoForm.symplecticVectorFields`, `TauCeti.SmoothTwoForm.interiorClass`; in `TauCeti.SmoothTwoForm.IsNondegenerate`: `negHamiltonianₗ`, `ker_negHamiltonianₗ`, `exact_negHamiltonianₗ_interiorClass`, `interiorClass_surjective` |
| Generic descent of a closed basic form with vertical kernel to a unique symplectic form | `TauCeti.SmoothForm.descendedForm`, `TauCeti.SmoothForm.eq_descendedForm_iff`, `TauCeti.SmoothTwoForm.isSymplectic_descendedForm_iff` |
| Closed coadjoint stabilizers and their Lie algebras | `TauCeti.Lie.isClosed_stabilizer_coadjointRepresentation`, `TauCeti.Lie.lieSubalgebraOfSubgroup_stabilizer_coadjointRepresentation` |
| The regular-value level manifold with tangent `ker dμ` | `TauCeti.regularLevelChartedSpace`, `TauCeti.isManifold_regularLevel`, `TauCeti.range_mfderiv_coe_regularLevel` |
| Quotients by discrete groups and the descent of invariant forms | `TauCeti.instIsManifoldQuotient`, `TauCeti.isLocalDiffeomorph_quotientMk`, `TauCeti.SmoothForm.descend` |

The generic form descent is the interface that LieGroupoidsPoisson §G7.2's isotropy quotients and §3.0a
both consume. The closed-wall fundamental-domain and wall-stabilizer theorems for Weyl groups are Tau
Ceti's
(`TauCeti.existsUnique_mem_orbit_inter_dominantChamber`, `TauCeti.stabilizer_eq_closure_wallReflections`).

**Owned elsewhere and consumed here.**

- *Bundles and quotients*: SmoothBundlesConnections §B1.0 (transverse fibre products), §B1.1 (descent of
  invariant maps), §B1.4 (free proper quotients, slices and tubes, homogeneous spaces, finite-isotropy
  slices), §B2.1 and §B2.5 (associated and adjoint bundles), §B3.1, §B4.1, §B4.2 (connections, curvature,
  gauge group), §B5.2 (holonomy). SmoothBundlesConnections owns the slices; this roadmap owns the gluing
  of symplectic forms on them.
- *Groupoids and Poisson structures*: LieGroupoidsPoisson §G4.6A and its Conventions (Lie–Poisson and
  sharp signs), §§G0.0, G3.4, G3.5 (groupoids, restrictions, bibundles, Morita), §G6.3 (the cotangent
  groupoid of a Lie group), §§G7.2–G7.4 (isotropy quotients, cotangent-groupoid actions, restricted
  action groupoids). The identification of symplectic leaves of `𝔤*` with coadjoint orbits is §G4.6B's,
  and `π♯df = −X_f` is §G4.3's; the flux sequence does not depend on that identification.
- *Compact Lie groups*: LieGroups Layer 5A (invariant inner product and splitting) and Layer 6 (maximal
  tori, real root data, Weyl comparison, rank-one representatives, conjugation into `𝔱`). The integral
  refinements are ConvexityToric §1.1's.
- *Morse theory*: MorseTheory §§2.3–2.4 (handles and CW exhaustion) and §5.1 (Morse–Bott attachment);
  MorseNovikov §6.4 (Lefschetz fixed-point formula); SchubertGeometry §9.7 (comparison with Schubert
  cells, downstream).
- *Symplectic and differential topology*: CotangentLagrangian §4.1 and §4.3 (fibre-homotopy
  primitives, with zero first jet) and §4.7 (Weinstein neighbourhoods); HeegaardFloer §4.1 (F2.1)
  (contraction inverse, primitives, Moser calculus, time-dependent pullback differentiation);
  DifferentialGeometry and DeRhamCohomologyAndDuality (Cartan calculus, flows, integration, compactly
  supported and relative de Rham theory, degree, Sard); GeometricTopology (collars, Morse functions on
  manifolds with boundary, tubular neighbourhoods); AlgebraicTopology (CW pairs, cochains, universal
  coefficients, twisted Poincaré duality).
- *Orbifolds*: Orbifolds O1.4, O2 and O4.2 (presentations, retained-arrow charts, invariant forms and
  their Morita comparison); O7's comparisons are downstream.
- *Analysis*: ComplexKahlerGeometry §5.4 and §5.7 (bundle Sobolev scale, Laplace estimates, Green
  operator) and PDE Layers 4–5 (scalar elliptic estimates); the rough-coefficient and gauge applications
  are this roadmap's.

**Not claimed.** The flux sequence is finite-dimensional; nothing is asserted for Banach manifolds, where
`ω♭` need not be onto the dual. No theorem integrating the Lie algebra cocycle of a moment map to a central extension of the
group is asserted without separate global data. No discreteness of `Γ_ω` or `Γ_(ω,c)`, Hausdorffness of
the flux quotients or Lie structure on them is asserted.

Other roadmaps cite sections of this roadmap by the labels of its former numbering:

| Former label | Now |
|---|---|
| R1 | Layer 1 |
| R1a | Layer 1a |
| R2 | Layer 2 |
| R2a | Layer 2a |
| R3 | Layer 3 |
| R3.1 | §3.1 |
| R4 | Layer 4 |
| R5 | Layer 5 |

## Exact supplier contracts

### From Mathlib

- `GroupLieAlgebra`, `LieGroup`, `ContMDiffSMul`, `ContMDiffConstSMul`, `MulAction.stabilizer`,
  `Representation.stabilizer`, `MulAction.orbitRel.Quotient`, `Subgroup.normalizer`.
- `properlyDiscontinuousSMul_iff_properSMul` (a discrete group acts properly discontinuously iff
  properly, under `CompactlyCoherentSpace`) and `t2Space_quotient_mulAction_of_properSMul`.
- `Submodule.dualQuotEquivDualAnnihilator`: `Module.Dual R (M ⧸ W) ≃ₗ[R] W.dualAnnihilator`.
- `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `Matrix.specialOrthogonalGroup`.
- `IsManifold.prod` and `Prod.instLieAddGroup`: products of manifolds and of additive Lie groups.

### From Tau Ceti

All are proved at the pin; paths are under `TauCeti/`.

- *Forms and Hamiltonian fields* (`Geometry/Manifold/TwoForm/Basic.lean`,
  `Geometry/Symplectic/Manifold/TwoForm.lean`, `Geometry/Symplectic/Hamiltonian/Manifold.lean`,
  `…/Hamiltonian/Bracket.lean`): `TauCeti.SmoothTwoForm` (`= SmoothForm I M ℝ 2`),
  `SmoothTwoForm.IsSymplectic`, `SmoothTwoForm.IsNondegenerate`, `SmoothTwoForm.IsHamiltonianVectorField`
  (`ι_X σ = df`), `SmoothTwoForm.hamiltonianVectorField`, `SmoothTwoForm.poissonBracket` (`df(X_g)`),
  `IsNondegenerate.hamiltonianVectorField_poissonBracket` (`X_({f,g}) = −[X_f, X_g]` for closed
  nondegenerate `σ` on a finite-dimensional manifold), `TauCeti.mlieDerivForm_eq_interior_mextDeriv_add`
  (Cartan's formula).
- *Actions and moment maps* (`Geometry/Lie/FundamentalVectorField.lean`,
  `Geometry/Manifold/VectorField/InfinitesimalAction.lean`, `Geometry/Symplectic/Hamiltonian/MomentMap.lean`,
  `…/EquivariantMomentMap/Basic.lean`, `…/EquivariantMomentMap/Prod.lean`): the declarations of the
  first five rows of the table above, with `TauCeti.InfinitesimalAction.isotropy`,
  `TauCeti.InfinitesimalAction.orbitTangent`, `TauCeti.InfinitesimalAction.finrank_orbitTangent_add_finrank_isotropy`,
  `TauCeti.mfderiv_smul_fundamentalVectorField`, `SmoothTwoForm.IsMomentMap.differential`,
  `IsMomentMap.ker_differential` (`ker dμ_x = (𝔤 · x)^σ`), `IsMomentMap.range_differential` and
  `IsMomentMap.differential_surjective_iff` (finite-dimensional, nondegenerate: `dμ_x` onto iff the
  isotropy algebra is zero). The group-level statements assume a smooth action of a smooth Lie group on a
  preconnected manifold by elements with `g* σ = σ`, as the hypotheses of each declaration state.
- *Cotangent bundles* (`Geometry/Manifold/VectorBundle/Cotangent/Basic.lean`,
  `Geometry/Symplectic/Cotangent/Bundle/*.lean`, `Geometry/Symplectic/Cotangent/MomentMap.lean`):
  `TauCeti.CotangentBundle`, `CotangentBundle.liouvilleForm`, `CotangentBundle.symplecticForm` (`−dλ`),
  `CotangentBundle.momentMap`, `CotangentBundle.mpullback_smul_liouvilleForm`,
  `CotangentBundle.isEquivariantMomentMap_momentMap`, the fibrewise translation by a one-form
  (`Bundle/Fiberwise.lean`: `τ_α* ω = ω − π* dα`), `TauCeti.cotangentMomentMap`.
- *Symplectic vector fields* (`Geometry/Symplectic/Hamiltonian/SymplecticVectorField.lean`): the
  declarations of the table, for a nondegenerate form on a finite-dimensional manifold.
- *de Rham cohomology* (`Geometry/Manifold/DeRham/*.lean`): `TauCeti.deRhamCohomology`,
  `TauCeti.deRhamCohomologyZeroEquiv`, `deRhamCohomology.period`,
  `TauCeti.compactlySupportedDeRhamCohomology`, `compactlySupportedDeRhamCohomology.toDeRhamCohomology`.
- *Diffeomorphism groups* (`Geometry/Diffeomorphism/*.lean`, `Geometry/Manifold/ContMDiffMap/Chart/Topology.lean`):
  `TauCeti.Diff` (the group of smooth diffeomorphisms), `Diffeomorph.applyMulAction`,
  `Diffeomorph.fixingSubgroup`, `ContMDiffMap.manifoldWeakWhitneyTopology`
  (no compactness), `Diffeomorph.weakWhitneyTopology`, `Diffeomorph.continuous_trans`,
  `Diffeomorph.continuous_symm`, `Diffeomorph.isTopologicalGroup`, `Diffeomorph.isClosed_fixingSubgroup`
  (compact Hausdorff manifolds modelled on locally compact spaces); `TauCeti.Diffeotopy` with
  `Diffeotopy.trans` (slices `Ψ_t ∘ Φ_t`) and `Diffeotopy.symm` (slices `Φ_t⁻¹`), carrying no collar data;
  `TauCeti.exists_contMDiffMap_isProperMap_nonneg` (smooth proper exhaustions).
- *Circles* (`Geometry/Manifold/Instances/AddCircle.lean`): `AddCircle.instChartedSpace`,
  `AddCircle.instIsManifold` and `AddCircle.instLieAddGroup`, the analytic manifold and additive Lie
  group `AddCircle p` for every `p` with `Fact (0 < p)`.
- *Regular levels and descent* (`Geometry/Manifold/RegularValue/Level.lean`,
  `Geometry/Manifold/DifferentialForm/Pullback/Submersion.lean`, `Geometry/Symplectic/Manifold/Descent.lean`,
  `Geometry/Manifold/Instances/Quotient.lean`, `Geometry/Manifold/DifferentialForm/Quotient.lean`):
  `TauCeti.regularLevelChartedSpace`, `TauCeti.isManifold_regularLevel`,
  `TauCeti.isSmoothEmbedding_coe_regularLevel`, `TauCeti.range_mfderiv_coe_regularLevel`;
  `RoughForm.IsBasic`, `SmoothForm.descendedForm`, `SmoothForm.eq_descendedForm_iff`,
  `SmoothTwoForm.isSymplectic_descendedForm_iff` (for a surjective smooth submersion with boundaryless
  source); `TauCeti.instIsManifoldQuotient`, `TauCeti.isLocalDiffeomorph_quotientMk`,
  `SmoothForm.descend`, `SmoothForm.eq_descend_iff`, `SmoothForm.isClosed_descend_iff` (free, properly
  discontinuous actions on Hausdorff locally compact manifolds).
- *Lie groups* (`Geometry/Lie/**`, `Algebra/Lie/Coadjoint.lean`, `Geometry/Symplectic/Coadjoint.lean`):
  `Lie.coadjointRepresentation`, `Lie.Ad`, `Lie.isEmbeddedLieSubgroup_of_isClosed`,
  `Lie.lieSubalgebraOfSubgroup`, `Lie.mem_lieSubalgebraOfSubgroup`,
  `leftInvariantDerivationLieEquivGroupLieAlgebra`, `Lie.isClosed_stabilizer_coadjointRepresentation`,
  `Lie.isEmbeddedLieSubgroup_stabilizer_coadjointRepresentation`,
  `Lie.lieSubalgebraOfSubgroup_stabilizer_coadjointRepresentation`; `Module.Dual.kksForm`,
  `Module.Dual.kksForm_nondegenerate`, `Module.Dual.kksForm_mk_left`, `Module.Dual.kksForm_jacobi`,
  `Module.Dual.coadjointTangentMap`, `Module.Dual.coadjointTangentMap_injective`,
  `Module.Dual.even_finrank_quotient_lieAnnihilator`; `Lie.IsTorus`, `Lie.IsMaximalTorus`,
  `Lie.exists_isMaximalTorus`, `Lie.IsTorus.exists_closedZpowers_eq`,
  `Lie.IsMaximalTorus.lieSubalgebraOfSubgroup_centralizer`, `Lie.IsMaximalTorus.finite_normalizerQuotient`;
  `TauCeti.heisenberg`; the real Heisenberg group `TauCeti.Nil` with its analytic charts, and
  `TauCeti.Nil.toHeisenberg` (`Geometry/Manifold/Riemannian/Nil/Basic.lean`).
- *Root systems* (`LinearAlgebra/RootSystem/Chamber.lean`, `…/FundamentalDomain.lean`):
  `RootPairing.dominantChamber`, `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (every Weyl orbit
  meets the closed dominant chamber exactly once, for a finite crystallographic reduced root system over
  a linearly ordered field), `TauCeti.stabilizer_eq_closure_wallReflections` (the stabilizer of a dominant
  point is generated by its wall reflections).
- *Morse theory* (`Geometry/Manifold/Morse/*.lean`): `TauCeti.IsManifoldNondegenerateCriticalPoint`,
  `TauCeti.manifoldMorseIndex`, `TauCeti.criticalHessian`, `TauCeti.manifoldMorseIndex_eq_sigNeg_criticalHessian`,
  `TauCeti.IsMorse`, `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation` (one critical level at a
  time).
- *Compact groups and linear algebra*: `TauCeti.haarProb`, `TauCeti.haarAverage`
  (`RepresentationTheory/Compact/*.lean`); `SymplecticForm.exists_isSymplectomorphism_extend` (linear Witt
  extension, not equivariant); `CliffordAlgebra.simplyConnectedSpace_realCliffordSpinGroupZero` (compact
  `Spin(n)`, `n ≥ 3`, is simply connected).

### From TauCetiRoadmap.SmoothBundlesConnections

§B1.0 (regular fibres, transverse fibre products, kernel distributions); §B1.1 (principal structure and
descent of invariant maps); §B1.4 (the free proper quotient theorem, the principal bundle of a free proper
action, proper-action slices and tubes, finite-isotropy slices with equivariant transitions,
homogeneous spaces `G/H` with their principal bundles and tangent descriptions); §B2.1 (associated
bundles); §B2.5 (adjoint bundle and invariant pairings); §B3.1 (principal connections and their affine
space); §B4.1 (curvature, `F_(A+a) = F_A + d_A a + ½[a ∧ a]`); §B4.2 (gauge group); §B5.2 (holonomy and flat
connections, equivalent to representations of the fundamental groupoid).

### From TauCetiRoadmap.LieGroupoidsPoisson

Conventions (sharp `β(π♯α) = π(α, β)`); §G4.6A (positive Lie–Poisson structure); §§G0.0, G3.4, G3.5
(groupoids, restrictions, bibundles, Morita equivalence); §G6.3 (the cotangent groupoid `T*G ⇉ 𝔤*`);
§G7.2 (isotropy quotient of a level, `q* ω_red = i* ω`); §G7.3 (Hamiltonian actions as cotangent-groupoid
actions); §G7.4 (`G ⋉ O ≅ (T*G)|_O`).

### From TauCetiRoadmap.RepresentationTheory.LieGroups

Layer 5A (an `Ad`-invariant positive inner product on the Lie algebra of a compact connected group and the
splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤, 𝔤]`); Layer 6 (existence, conjugacy and exhaustion of maximal tori; root
characters `χ_α` with `dχ_α = iα`; the real root and coroot pairing; the comparison of `N(T)/T` with the
abstract Weyl group; rank-one representatives `n_α ∈ N(T)`, lying in `Z_G(X)⁰` when `α(X) = 0`; every
element of `𝔤` conjugate into `𝔱`).

### From TauCetiRoadmap.MorseTheory and TauCetiRoadmap.MorseNovikov

MorseTheory §2.3 (handles), §2.4 (CW exhaustion), §5.1 (critical normal bundles and Morse–Bott
attachments). MorseNovikov §6.4 (the Lefschetz fixed-point formula for self-maps of closed manifolds).

### From TauCetiRoadmap.SymplecticGeometry.CotangentLagrangian

Layer 4: §4.1 (relative Poincaré lemma by tubular fibre scaling), §4.3 (the primitive with zero first
jet when two forms agree as ambient tensors along the submanifold), §4.7 (Weinstein neighbourhoods of
compact Lagrangians).

### From TauCetiRoadmap.HeegaardFloer

§4.1 (F2.1): the contraction inverse of a symplectic form, primitive and Moser calculus, two-time flows,
time-dependent pullback differentiation.

### From TauCetiRoadmap.DifferentialGeometry and TauCetiRoadmap.DeRhamCohomologyAndDuality

DifferentialGeometry §0.4 (`SmoothTwoForm I M` is `SmoothForm I M ℝ 2`), §1.4 (Cartan calculus), §3.5
(time-dependent flows), §5.4 (homotopy operator), Layer 5 (integration and Stokes), §6.2 (local Poincaré
lemma), §6.4 (compact supports), §§8.3–8.4 (smooth chains and integration over them), Layer 10 (degree),
§10.2 (Sard). DeRhamCohomologyAndDuality §2.4 (relative smooth chains) and Layer 3 (relative de Rham
theory).

### From TauCetiRoadmap.GeometricTopology and TauCetiRoadmap.AlgebraicTopology

GeometricTopology §1.1 (collars), §1.3.1 (Morse functions on compact manifolds with boundary), §1.5
(tubular neighbourhoods). AlgebraicTopology Layer 4 (CW pairs and cellular homology), §6.1 (local-system
cochains, universal coefficients), §6.4 (Poincaré–Lefschetz duality with local coefficients).

### From TauCetiRoadmap.Orbifolds

O1.4 (slice presentations retaining group elements, Morita bibundle to the action groupoid,
slice-refinement independence), O2 (retained-arrow charts), O4.2 (invariant forms `s*ω = t*ω` and their
Morita descent).

### From TauCetiRoadmap.ComplexKahlerGeometry and TauCetiRoadmap.PDE

ComplexKahlerGeometry §5.4 (`BundleSobolev E s`, localization, Hilbert carrier) and §5.7 (smooth-coefficient
Laplace-type estimates, regularity, Green operator). PDE Layers 4–5 (scalar elliptic existence and
regularity).

### From TauCetiRoadmap.SpinGeometry

§1.1 (G1.1): the comparison of positive and negative even Clifford algebras and their Spin groups.

## References

- Ana Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
  Lecture Notes in Mathematics 1764, Springer, 2001 (author's revised version, 2006): Definition 22.1,
  §22.4, Homework 17, Theorems 23.1 and 23.4, §23.2, §§24.3–24.4, §§25.3–25.4.
- Eckhard Meinrenken, [*Symplectic geometry*](https://www.math.utoronto.ca/mein/teaching/LectureNotes/symplectic.pdf),
  lecture notes, University of Toronto, Fall 2024: Remarks 7.13, Propositions 7.18 and 7.20,
  Theorems 7.25 and 7.46, Theorem 8.3 and Remark 8.4, Proposition 8.6, Example 8.9, Proposition 8.13.
- Augustin Banyaga, *Sur la structure du groupe des difféomorphismes qui préservent une forme
  symplectique*, Comment. Math. Helv. 53 (1978), 174–227: Propositions II.1.1, II.3.1, II.3.3,
  Remarque II.1.2, pp. 184 and 191, §III.6.
- Raoul Bott, [*An application of the Morse theory to the topology of Lie-groups*](https://www.numdam.org/item/BSMF_1956__84__251_0),
  Bull. Soc. Math. France 84 (1956), 251–281: §11, Propositions 11.4–11.5, Theorem III.
- Marcos M. Alexandrino and Renato G. Bettiol, [*Introduction to Lie groups, isometric and adjoint
  actions and some generalizations*](https://arxiv.org/abs/0901.2374v3), arXiv:0901.2374v3 (2010),
  §4.3: Lemma 4.26, Theorem 4.31; numbering of this version.
- Larry Bates and Eugene Lerman, [*Proper group actions and symplectic stratified spaces*](https://arxiv.org/abs/dg-ga/9407003v1),
  Pacific J. Math. 181 (1997), 201–229; numbering and pages of arXiv dg-ga/9407003v1: §2, Theorems 7,
  9 and 15, Corollaries 10, 12 and 14, Proposition 11.
- Juan-Pablo Ortega and Tudor S. Ratiu, [*Cotangent bundle reduction*](https://arxiv.org/abs/math/0508636v1),
  arXiv:math/0508636v1 (2005), pp. 1–3.
- Johannes Huebschmann, [*The singularities of Yang–Mills connections for bundles on a surface. I. The
  local model*](https://arxiv.org/abs/dg-ga/9411006v1), Math. Z. 220 (1995), 595–609; numbering and pages
  of arXiv dg-ga/9411006v1: §§2.18–2.32.
- Johannes Huebschmann, [*The singularities of Yang–Mills connections for bundles on a surface. II. The
  stratification*](https://arxiv.org/abs/dg-ga/9411007v1), Math. Z. 221 (1996), 83–92; numbering and
  pages of arXiv dg-ga/9411007v1: Theorem 2.3, Lemma 2.4.
- Paul M. N. Feehan, [*Optimal Łojasiewicz–Simon inequalities and Morse–Bott Yang–Mills energy
  functions*](https://arxiv.org/abs/1706.09349v7), arXiv:1706.09349v7 (2020), Theorem 2.3; numbering and
  pages of this version.
