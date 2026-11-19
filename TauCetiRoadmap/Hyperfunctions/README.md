# Roadmap: Sato hyperfunctions and analytic generalized functions

**Summary.** A hyperfunction on an open set `U ⊆ ℝ` is a pair of holomorphic functions on the upper
and the lower half-plane near `U`, read as the difference of their boundary values on `U`, modulo
the pairs that continue holomorphically across `U`. The space is `O(ℂ ∖ ℝ) / O(ℂ ∖ (ℝ ∖ U))`; every
distribution, every analytic functional and every "function" such as `bv₊ exp(1/z²)` defines one.
In dimension `n` Sato replaces the quotient by local cohomology: for a real-analytic manifold `M`
of dimension `n` sitting as the real locus in a complexification `X`, the sheaf of hyperfunctions
is `B_M = 𝓗ⁿ_M(O_X) ⊗ or_(M/X)`, the `n`-th local cohomology sheaf of holomorphic functions with
supports in `M`, twisted by the relative orientation sheaf. This roadmap builds `B_M` on every
Hausdorff, second-countable real-analytic manifold without boundary, of every finite dimension,
compact or not, orientable or not; its versions with values in analytic vector bundles, its
hyperforms and hyperdensities; the analytic operations on it; microfunctions and the analytic
wavefront set; and the embedding of distributions.

The first headline theorem is **purity**: if `M` is a real-analytic manifold of dimension `n` and
`X` a complexification, then `𝓗^q_M(O_X) = 0` for every `q ≠ n`, so that `𝓗ⁿ_M(O_X)` is the only
nonzero local cohomology sheaf; once the normal bundle of `M` over an open `U` is oriented, the
sections of `B_M` over `U` are the relative cohomology `Hⁿ_U(W, O)` of any complex neighbourhood `W`
with `W ∩ M = U`. The second is **flabbiness**:
every hyperfunction on an open subset of `M` extends to every larger open subset, and the
extensions form a coset of the hyperfunctions supported in the complement. The third is
**compact analytic duality**: for a compact `K ⊆ ℝⁿ` and an open neighbourhood `V` of `K` in `ℂⁿ`,
`H^q_K(V, O) = 0` for `q ≠ n` and `Hⁿ_K(V, O)` is the continuous dual of the space `A[K]` of
germs of holomorphic functions along `K`, naturally in `K`; on a manifold, hyperfunctions supported
in a compact set are the analytic functionals on germs of analytic densities. The fourth is the
**distribution embedding**: there is an injective sheaf morphism from distributions to
hyperfunctions, compatible with restriction, analytic differential operators and analytic changes of
coordinates. On `ℝ` it is the only family of linear maps commuting with restriction that sends a
compactly supported distribution `u` to the class of its Cauchy transform
`C_u(z) = (2πi)⁻¹ ⟨u_t, χ(t)/(t − z)⟩`, and the jump `C_u(x + i0) − C_u(x − i0)` is `u` itself.

The sheaf-theoretic core of the first layer comes from Tau Ceti: cohomology with supports in a
closed set, its long exact sequences and excision, the local cohomology sheaves, support
truncation and the degenerate edge comparison, flasque locality, and in dimension one the quotient
presheaf and the Cauchy transform. [RealAnalyticGeometry](../RealAnalyticGeometry/README.md)
supplies the complexification of `M` and Stein theory on it;
[ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) supplies Dolbeault resolutions,
holomorphic bundles and the distributions and smooth-section spaces on manifolds;
[GlobalHolomorphicFunctions](../GlobalHolomorphicFunctions/README.md) supplies the one-variable
`∂̄` solver and Cousin I, which give gluing in dimension one;
[PseudodifferentialOperators](../PseudodifferentialOperators/README.md) supplies elliptic
regularity and the smooth wavefront calculus that the analytic one refines. The layers are
described below.

## How to read the build

Layer 0 builds closed supports, the relative Dolbeault complex and the relative orientation sheaf.
Layer 1 constructs the Sato sheaves, their bundle and form versions, and the dimension-one
quotient. Layer 2 proves Malgrange's top-degree vanishing, the Fréchet–Schwartz duality theory,
the compact-current regularization and Stein duality, and with them compact duality, purity,
flabbiness and the manifold duality. Layer 3 builds the analytic operations and boundary values
from wedges; Layer 3a builds microfunctions, the analytic wavefront set and noncharacteristic
pullback and products. Layer 4 constructs the distribution embedding and compares boundary values
and wavefronts; Layer 5 proves arbitrary-open extension and works out the examples. Each
subsection's *Needs:* line lists what its statement and its route use, so that a target proved by
another route is not blocked behind an unrelated section.

## Conventions

1. **Manifolds and components.** `M` is a Hausdorff, second-countable real-analytic manifold
   without boundary on Mathlib's fixed-model carriers (`ChartedSpace`, `IsManifold` at regularity
   `ω`), of dimension `n` for some finite `n`; noncompact and nonorientable `M` are included.
   Analytic vector bundles use Mathlib's `VectorBundle` carriers and have a fixed finite rank `r`.
   A space whose dimension or rank varies is an explicitly indexed disjoint union of such
   components: its sheaf is the product of the sheaves of sections over the component opens, and
   restriction, gluing and every operation of this roadmap are constructed and proved componentwise.
   In dimension `0` a hyperfunction on a discrete space is an arbitrary complex-valued function, and
   dimension `0`, the empty manifold and rank `0` are treated directly wherever a statement is made.
2. **Coefficients.** Sheaves are `TopCat.Sheaf (ModuleCat ℂ)` with their actual morphisms, kernels,
   cokernels and derived cohomology. The supported functors are built both for `ModuleCat ℂ` and
   for `AddCommGrpCat` (equivalently `ModuleCat ℤ`, used for orientation calculations), and are
   compared. Relative complexes, analytic sheaf modules and orientation local systems keep their
   actual coefficient categories. Every section map, cohomology map and comparison of
   representatives is natural in the open inclusions and coefficient morphisms in its statement.
3. **Closed supports.** For a closed `S ⊆ X` and an open `W`, `Γ_S(W, F) = ker(F(W) → F(W ∖ S))`, and
   `H^q_S(W, F)` is Tau Ceti's `CategoryTheory.Sheaf.supportedModuleH`: `Ext^q(Q_S(W), F)` for the
   cokernel `Q_S(W)` of the map of free sheaves `C_(W∖S) → C_W`. `𝓗^q_S(F)` is the sheafification
   of `W ↦ H^q_S(W, F)` (`CategoryTheory.Sheaf.supportedModuleHSheaf`).
4. **The relative convention.** Mathlib's `CochainComplex.mappingCone` of `f : F → G` has
   differential `(a, b) ↦ (−d_F a, f a + d_G b)`, and the shift by `−1` multiplies it by `−1`, giving
   `(d_F a, −f a − d_G b)`. The coordinate change `(a, b) ↦ (a, −b)` gives the relative convention
   used throughout, which is Tau Ceti's `CochainComplex.mappingCocone.relativeCoordinates`: for
   closed `S ⊆ W` the relative Dolbeault cochains in bidegree `(p, q)` are
   `A^(p,q)(W) ⊕ A^(p,q−1)(W ∖ S)` with `d_rel(α, β) = (∂̄α, α|_(W∖S) − ∂̄β)`.
5. **Forms.** `(p, q)`-forms are holomorphic-first, `dz_I ∧ dz̄_J`. The canonical line of `ℂⁿ` is
   trivialized by `dz₁ ∧ ⋯ ∧ dz_n`, and `∂̄(dz_I ∧ β) = (−1)^p dz_I ∧ ∂̄β` for `|I| = p`.
6. **Orientation.** On `ℂⁿ` with `z = x + iy`, the real locus `ℝⁿ = {y = 0}` is oriented
   normal-first: the normal coordinates `y` come before the tangent coordinates `x`. This differs
   from the interleaved complex orientation `(x₁, y₁, …, x_n, y_n)` by `(−1)^(n(n+1)/2)`. Relative
   integration uses the boundary convention `R₀₁ = −∂R₁`. `or_(M/X)` is the relative orientation
   sheaf of §0.3, and `or_y` its generator given by the normal coordinates `y`.
7. **Topologies.** FS means Fréchet–Schwartz; DFS means a locally convex space topologically
   isomorphic to the strong dual of an FS space. `StrongDual ℂ E` is Mathlib's `E →L[ℂ] ℂ` with the
   topology of uniform convergence on von Neumann bounded sets. The global smooth-section FS carrier
   and its compact-current strong dual are distinct from the LF space of compactly supported smooth
   sections and its continuous dual with the topology of compact convergence; every comparison below
   proves continuity for the stated topologies. The microlocal conic sheaves of Layer 3a are sheaves
   of complex vector spaces; their derived operations do not define a topology on hyperfunction
   sections by transport of a distribution topology.
8. **Distributions and pairings.** Pairings are bilinear. A real-test distribution is extended to
   complex tests by `T(φ + iψ) = Tφ + iTψ`, which is Tau Ceti's `Distribution.complexPairing`.
   Fourier transforms use PseudodifferentialOperators' angular-frequency phase `exp(−i x·ξ)`, related
   to Mathlib's `2π` convention by `ξ = 2πζ`. An analytic covector `ξ` at a point of `M` is viewed as
   the complex conormal `iξ`, whose underlying real conormal is `−ξ dy`; the identification with
   real normal covectors `η` is `ξ(v) = −η(Jv)`.
9. **Euclidean kernels.** On `ℝ^d`, `Δ = Σ_a ∂_a²` and the fundamental solution with `ΔE = δ` is
   `E = log‖x‖/(2π)` for `d = 2` and `E = ‖x‖^(2−d)/((2−d) area(S^(d−1)))` for `d > 2`. These are the
   negatives of Tau Ceti's `TauCeti.planarNewtonianKernel` and `TauCeti.newtonianKernel`, which are
   fundamental solutions of `−Δ`.
10. **Names.** The headline theorems are declared in `TauCetiRoadmap.Hyperfunctions` in
    `Suggested.lean`; a target written in prose has no declaration there.

## Layer 0: closed supports, relative complexes and locality

Honda–Izawa–Suwa fixes the relative representative and its conventions. Tau Ceti owns the abelian and module
supported theory listed under the supplier contracts; this layer adds the derived-functor and
coefficient comparisons, the edge comparison for complex coefficients, the relative Dolbeault
complex and the relative orientation sheaf.

### 0.1 Supported cohomology, local cohomology sheaves and the edge comparison

For closed `S ⊆ X`, `Γ_S(W, F)` is left exact in `F`. Tau Ceti's supported cohomology (supplier
contracts) gives `H^q_S(W, F)` as
`Ext^q(Q_S(W), F)` with `Hom(Q_S(W), F) ≃ Γ_S(W, F)`, its restriction maps, excision, the long exact
sequences of the pair, of an open triple and of supports `Z ⊆ S`, the local cohomology sheaves
`𝓗^q_S(F)`, their vanishing off `S` and for flasque `F`, support truncation (if `𝓗^q_S(F) = 0` for
`q < n` then `H^q_S(W, F) = 0` for `q < n` and every open `W`), and the degenerate edge comparison: if
`𝓗^q_S(F) = 0` for every `q ≠ n`, then `H^(n+j)_Z(W, F) ≅ H^j_Z(W, 𝓗ⁿ_S(F))` for every closed `Z ⊆ S`
and every `j`, as presheaves in `W`, in degree `j = 0` equal to `Γ_Z(W, 𝓗ⁿ_S(F))`. Tau Ceti states
all of this for abelian coefficients (`CategoryTheory.Sheaf.supportedH`,
`CategoryTheory.Sheaf.supportedHPresheafEdgeIso`), and for module coefficients the supported groups,
the sequences of supports, excision, flasque vanishing and the local cohomology sheaves
(`CategoryTheory.Sheaf.supportedModuleH`, `CategoryTheory.Sheaf.supportedModuleHSheaf`).

Prove, for sheaves of complex vector spaces:

- **Derived functors.** The right derived functors of `Γ_S(W, −)` and of the sheaf-valued functor
  `F ↦ Γ_S(F)`, built with `Functor.rightDerivedFunctorPlus` on `DerivedCategory.Plus`, agree with
  `H^q_S(W, −)` and with `𝓗^q_S(−)`, naturally in `F`, in `W` and under restriction, and are computed
  by injective and by flasque resolutions.
- **Coefficient comparisons.** `H^q_S(W, F)` and `𝓗^q_S(F)` for `F` a sheaf of complex vector spaces
  agree, as abelian groups, with the abelian-coefficient groups of the underlying abelian sheaf, and
  carry the complex structure by functoriality in the scalars; the same holds for sheaves of
  `ℤ`-modules against abelian sheaves. For a locally constant sheaf `L` of free `ℤ`-modules of rank
  one (an orientation local system) prove `𝓗^q_S(F ⊗_ℤ L) ≃ 𝓗^q_S(F) ⊗_ℤ L`, naturally in `F`. Hence
  support truncation and the degenerate edge comparison, with their restriction maps, hold for complex
  coefficients with complex-linear isomorphisms.
- **Composition of supports.** For closed `Z ⊆ S`, `RΓ_Z = RΓ_Z ∘ RΓ_S` as derived functors,
  compatibly with restriction. With the bounded-below local hypercohomology filtration of `RΓ_S(F)`
  by truncations and its restriction maps, this gives the degenerate edge comparison and support
  truncation as edge maps; prove that these agree with Tau Ceti's comparisons.
- **The free sheaf and the constant-ring module carrier.** For an open `O ⊆ W`, `C_O` is the
  sheafification of the free complex vector space presheaf corepresenting sections on `O`; construct
  the free-presheaf and sheafification adjunction for it and its comparison with the constant-ring
  `SheafOfModules` carrier, with `Q_S(W) = coker(C_(W∖S) → C_W)`.

`HasSheafify` holds on every open-set site used here, and in the universes used here sheaves of
modules have enough injectives (Tau Ceti's universe transport through `ULift` of the scalar ring);
check the coefficient and morphism universes of each instance where it is used.
*Needs:* Tau Ceti's supported and local cohomology (supplier contracts), Tau Ceti
`TauCeti.enoughInjectives_topCatSheaf_moduleCat`, `TauCeti.hasSheafify_moduleCat`; Mathlib
`Functor.rightDerivedFunctorPlus`, `DerivedCategory.Plus`, `HasDerivedCategory.standard`,
`CategoryTheory.IsGrothendieckAbelian.enoughInjectives`, the stalk exactness and zero detection of
`Mathlib/Topology/Sheaves/Abelian.lean`.

**Checks.**
- For the constant sheaf `ℤ` on `ℝ` and `S = {0}`: `H⁰_S(ℝ, ℤ) = 0`, and the pair sequence
  `0 → H⁰(ℝ) → H⁰(ℝ ∖ 0) → H¹_S(ℝ, ℤ) → H¹(ℝ) = 0` reads `0 → ℤ → ℤ² → H¹_S → 0`, so
  `H¹_S(ℝ, ℤ) ≅ ℤ`. Defining `H^q_S(W, F)` as `H^(q−1)(W ∖ S, F)`, without the quotient by the image
  of `H^(q−1)(W, F)`, would give `ℤ²`.
- For a flasque `F`, `𝓗^q_S(F) = 0` for every `q > 0` and every closed `S`; for the constant sheaf
  `ℤ` on `ℝ` and `S = {0}` the sheaf `𝓗¹_S(ℤ)` is the skyscraper `ℤ` at `0`, so the constant sheaf is
  not flasque.

### 0.2 The relative Dolbeault complex

Identify derived supports with the shifted cone `Cone(RΓ(W, F) → RΓ(W ∖ S, F))[−1]`, in the relative
coordinates of Convention 4. For `F = Ω^p` use the cone of the ordinary fine Dolbeault resolutions
on `W` and on `W ∖ S`: the relative Dolbeault complex `A^(p,•)(W, W ∖ S)` with `d_rel` of
Convention 4. Prove that `d_rel` squares to zero; describe its cycles (`∂̄α = 0` and
`α|_(W∖S) = ∂̄β`) and boundaries; prove complex linearity, independence of the resolution,
compatibility with restriction and shrinking of `W` and with refinement, excision, and its
identification with `H^q_S(W, Ω^p)`. Fix every product sign: the cup products of relative cochains
with forms and with relative cochains, and their compatibility with `d_rel`. Build the relative de
Rham complex, its comparison with the relative Dolbeault complex, and the type projection. The cup
product used for local duality is the one with the supports specified in §2.1 and §2.3; no
same-variable product of arbitrary hyperfunctions is asserted.
*Needs:* §0.1; Tau Ceti `CochainComplex.mappingCocone.relativeCoordinates`; Mathlib
`CochainComplex.mappingCone`, `CochainComplex.mappingCocone`; ComplexKahlerGeometry §2.5 (the
sheaves `Ω^p`, the fine resolution by smooth `(p, q)`-forms and the Dolbeault theorem) and §1.3
(type calculus).

**Checks.**
- `d_rel² = 0`: `d_rel(∂̄α, α| − ∂̄β) = (∂̄²α, ∂̄α| − ∂̄α| + ∂̄²β) = 0`. The plausible wrong sign
  `d(α, β) = (∂̄α, α| + ∂̄β)` gives `d²(α, β) = (0, 2∂̄α|)`, which is not zero.
- On `W = ℂ`, `S = {0}`, `p = 0`: a relative `1`-cocycle `(α, β)` with `α = 0` is a holomorphic
  function `β` on `ℂ ∖ 0` up to restrictions of holomorphic functions on `ℂ`, so
  `H¹_{0}(ℂ, O) ≅ O(ℂ ∖ 0)/O(ℂ)`, the principal parts at `0`.

### 0.3 The relative orientation sheaf

For a real `n`-codimensional closed embedding `M ⊆ X`, define `or_(M/X) = 𝓗ⁿ_M(ℤ_X)`. Compute its
stalks by local Euclidean relative cohomology: in normal coordinates `y` it is free of rank one,
generated by the class of the normal coordinates, and a change of normal coordinates acts by the sign
of the normal Jacobian determinant. Prove the canonical square pairing `or_(M/X) ⊗ or_(M/X) ≃ ℤ_M`,
the comparison with the orientation line of the normal bundle through the same local generators,
naturality in the coordinates, and the normal-first convention with its sign `(−1)^(n(n+1)/2)`
against the interleaved complex orientation (Convention 6). Relative integration uses the boundary
convention `R₀₁ = −∂R₁`. For `M ⊆ X` a real-analytic manifold in its complexification, Layer 1 uses
this sheaf, restricted to `M`. The orientation sheaf `or_M` of an `n`-manifold `M` is `or_(M/TM)` for
the zero section `M ⊆ TM`, whose normal bundle is `TM`; for `M ⊆ X` prove
`or_X|_M ≃ or_(M/X) ⊗ or_M` from `0 → TM → TX|_M → T_M X → 0`, with the normal-first identification of
Convention 6 (Honda–Izawa–Suwa, (2.13) and (6.7), pp. 7 and 21).
*Needs:* §0.1; Tau Ceti `TauCeti.SmoothEmbedding.NormalSpace` for the normal bundle.

**Checks.**
- For `{0} ⊆ ℝ`, `or = 𝓗¹_{0}(ℤ)` has stalk `ℤ` at `0` (§0.1's computation), and `y ↦ −y` acts by
  `−1`; the square pairing sends `g ⊗ g` to `1` for both generators `g`, so it does not see the
  choice of generator.
- The sign `(−1)^(n(n+1)/2)` is `−1, −1, 1, 1, −1, −1` for `n = 1, …, 6`: the permutation taking
  `(x₁, y₁, …, x_n, y_n)` to `(y₁, …, y_n, x₁, …, x_n)` has these signs. The guess `(−1)^n` agrees
  only for `n = 1, 4, 5`.

### Examples

For `M = ℝ ⊆ ℂ` and every open `W ⊆ ℂ`, the pair sequence and `H¹(W, O) = 0` give
`H¹_ℝ(W, O) ≅ O(W ∖ ℝ)/O(W)`: the relative cocycle `(0, −f)`, with `f` holomorphic on `W ∖ ℝ`,
represents the class of `f`, because the connecting map of the pair sequence sends `f` to `(0, −f)`
in the relative coordinates of Convention 4 (Honda–Izawa–Suwa, (4.5) and (6.2), pp. 13 and 19).
A cocycle `(∂̄a, β)` is cohomologous to `(0, β − a|_(W∖ℝ))`. The
orientation sheaf `or_(ℝ/ℂ)` is the constant sheaf `ℤ` on `ℝ` with generator `or_y`.

### Dependencies

Tau Ceti's supported cohomology, local cohomology sheaves and flasque locality; Mathlib's sheaf,
derived-category and mapping-cone APIs; ComplexKahlerGeometry Layers 1 and 2 for forms and the
Dolbeault resolution. Nothing of Layers 1–5 is used.

## Layer 1: Sato sheaves and analytic coefficients

Sato's construction; Honda–Izawa–Suwa for the relative Dolbeault representative.

### 1.1 The Sato sheaf and hyperforms

For closed `M` in its complexification `X` (RealAnalyticGeometry R3.0), with `n = dim M`, define

```
B_M     = 𝓗ⁿ_M(O_X)   ⊗_(ℤ_M) or_(M/X),
B_M^(p) = 𝓗ⁿ_M(Ω_X^p) ⊗_(ℤ_M) or_(M/X).
```

Construct their stalks, restriction maps and the module and sheaf laws. Use R3.0's uniqueness of
the complexification germ to compare the sheaves defined by any two complexifications, with
identity and composition coherence; then prove analytic chart descent and transport under local
diffeomorphisms. The orientation twist glues the nonorientable case. Before purity (§2.1c) these
are local cohomology sheaves; the identification of their sections with relative cohomology is
proved in §2.1c.
*Needs:* §§0.1, 0.3; RealAnalyticGeometry R3.0; ComplexKahlerGeometry §2.5 (`O` and `Ω^p` on `X`).

### 1.2 Analytic bundle coefficients

For a real-analytic complex vector bundle `E` of rank `r`, extend its analytic transition matrices
and their inverses holomorphically, shrink to a common germ of complexification, prove the cocycle
identities there by uniqueness on the real locus, and glue to a holomorphic bundle `E^hol` with
ComplexKahlerGeometry's holomorphic bundle carriers. Prove uniqueness of the germ of `E^hol`, and
compatibility with morphisms, tensor products, duals, pullbacks and charts. A real-analytic real
bundle is handled through its complexification and real involution. Define `B(E)` from `O(E^hol)`
with the same orientation twist, and prove the sheaf-level identification `B(E) ≃ B_M ⊗_(A_M) E`
(sheaf tensor product over the analytic scalar sheaf of §1.4) by local frames, with transition,
restriction and morphism coherence. The rank is fixed on each indexed component.
*Needs:* §1.1, §1.4; RealAnalyticGeometry R0 (holomorphic extension of real-analytic functions on
opens of `ℝ^m`) and R3.0; ComplexKahlerGeometry §4.1 (holomorphic bundles, glued by ComplexManifolds
Milestone 7).

### 1.3 Dimension one

Tau Ceti constructs the quotient presheaf `U ↦ O(ℂ ∖ ℝ)/O(W(U))` on `ℝ`, with
`W(U) = ℂ ∖ (ℝ ∖ U)`, in the ambient-function encoding in which holomorphic sections are extended by
zero outside their open domain; its restrictions are surjective and it is separated. Prove the
gluing theorem: it is a sheaf (`oneDimBoundaryPresheaf_isSheaf`). Compare the holomorphic sections
of the encoding with ComplexKahlerGeometry's holomorphic structure sheaf on opens of `ℂ`, and the
quotient with the local definition `B_ℝ(U) = H¹_U(W(U), O) ⊗ or`, compatibly with restriction and
with the normal orientation `or_y` (Honda–Izawa–Suwa, (6.2), p. 19).
*Needs:* Tau Ceti `TauCeti.Hyperfunction.oneDimBoundaryPresheaf`,
`TauCeti.Hyperfunction.oneDimBoundaryPresheaf_isSeparated`; GlobalHolomorphicFunctions §7.4 (Cousin
I on open subsets of `ℂ`) for gluing; §§0.2–0.3 and §1.1 for the comparison.

**Checks.**
- The class of `1/z` (on both half-planes) is zero on `U = (0, ∞)`, because `1/z` extends across
  `(0, ∞)`, and nonzero on `U = ℝ`, where it is `−2πi δ` (§3.6). A quotient by entire functions
  only would not depend on `U`, and the class of `1/z` would be nonzero on `(0, ∞)`.
- The function equal to `1` on the upper and `0` on the lower half-plane and the function equal to
  `0` on the upper and `−1` on the lower half-plane have the same class: their difference is the
  constant `1`, which extends across every `U`.

### 1.4 The analytic scalar sheaf and hyperdensities

Define the sheaf `A_M` of real-analytic functions as the holomorphic germs along `M`; it acts on
`𝓗ⁿ_M(O_X)`, on `B_M` and on `B(E)` by restriction and multiplication. Define hyperdensities as
`B_M ⊗_(A_M) (Ω_M^n ⊗ or_M)`.
*Needs:* §1.1.

### Examples

For `M = ℝ`, `X = ℂ`, `B_ℝ(U) ≅ O(W ∖ ℝ)/O(W)` for every open `W ⊆ ℂ` with `W ∩ ℝ = U` (Layer 0
example and §2.1c); with `W = ℂ ∖ (ℝ ∖ U)` this is Tau Ceti's quotient of §1.3. `B_M^(0) = B_M`. For `M` a point,
`B_M = ℂ`. For `M = ℝⁿ`, `B_M(U) = Hⁿ_U(W, O)` for any open `W ⊆ ℂⁿ` with `W ∩ ℝⁿ = U`, after §2.1c.

### Dependencies

Layer 0; RealAnalyticGeometry R0 and R3.0; ComplexKahlerGeometry Layers 2 and 4;
GlobalHolomorphicFunctions §7.4; Tau Ceti's one-dimensional quotient presheaf.

## Layer 2: purity, flabbiness and compact duality

Ito, *Theory of (vector valued) Sato hyperfunctions*, J. Math. Tokushima Univ. 20 (1986),
§§1.5–1.6, supplies the route: compact duality first, then purity from it by the boundary-support
argument. Sections 2.0a–2.0f are the analytic preparation; they are independent of each other
except where a *Needs:* line says otherwise, and none of them uses purity.

### 2.0a MalgrangeTopVanishing

**MalgrangeTopVanishing.** For `n ≥ 1`, every open `Ω ⊆ ℂⁿ` and `0 ≤ p ≤ n`, `Hⁿ(Ω, Ω^p) = 0`;
equivalently the top-degree smooth Dolbeault operator `A^(p,n−1)(Ω) → A^(p,n)(Ω)` is onto (Malgrange,
Lemme 3, part a, pp. 235–236, for `p = 0`; `Ω^p` is free on `Ω`). For
`p = 0` this is `exists_sum_dbar_eq`: every smooth `f` on `Ω` is `Σ_j ∂g_j/∂z̄_j` for smooth `g_j`.
For `n = 1` it is also GlobalHolomorphicFunctions §7.1, the global `∂̄` solver on open subsets of
`ℂ`. Dimension `0` is treated directly.

The route is the real Laplacian on `Ω ⊆ ℝ^(2n)` (Convention 9), through four steps.

- **Harmonic Runge.** Take a filled compact exhaustion `K_j ⊆ int K_(j+1)` of `Ω`: no connected
  component of `Ω ∖ K_j` is relatively compact in `Ω` (Tau Ceti). If `h` is harmonic on a
  neighbourhood of `K_j`, then for every `m` and `ε > 0` there is `H` harmonic on all of `Ω` with
  `max_(|α|≤m, x∈K_j) |∂^α(H − h)(x)| < ε`. Prove this by Hahn–Banach with ComplexKahlerGeometry
  §5.3's compact-distribution dual: a separating distribution `T` supported in `K_j` annihilates
  every harmonic function on `Ω`. Its Newton potential `w = E ∗ T` satisfies `Δw = T` and is real
  analytic off `K_j`. Annihilation of the pole kernels `E(· − a)` and all their derivatives at
  points `a ∉ Ω` makes every jet of `w` vanish there; annihilation of harmonic polynomials and the
  convergent exterior multipole expansion of `E` make `w` vanish near infinity. Filledness makes
  every component of `ℝ^(2n) ∖ K_j` unbounded or meet `ℝ^(2n) ∖ Ω`: a bounded component inside `Ω`
  would have compact closure in `Ω`. Unique continuation on each component (harmonic functions are
  real analytic) then gives `supp w ⊆ K_j`, using the vanishing near infinity on unbounded
  components and the vanishing jets at a point outside `Ω` on the others. Integration by parts
  against the germ `h` gives `⟨T, h⟩ = 0`, proving density. This roadmap owns the Newton potential
  of a compactly supported distribution, the exterior multipole expansion and these support
  arguments, with the exact support hypotheses stated.
- **Local Poisson problems.** For each bounded open `O` relatively compact in `Ω`, `f` is bounded on
  `O`, hence in `L²(O)`, and `O` lies in a ball of `ℝ^(2n)`; Tau Ceti's
  `TauCeti.PDE.existsUnique_isWeakSolutionDirichlet_laplacian_of_subset_ball`, applied to the real
  and imaginary parts of `−f`, gives `v ∈ H¹₀(O)` with weak identity `∫ ∇η·∇v = −∫ fη` for all
  `η ∈ H¹₀(O)`, that is `Δv = f` weakly; PseudodifferentialOperators §6.2's interior elliptic
  regularity makes `v` smooth on `O`.
- **The exhaustion limit.** Along the exhaustion, subtract global harmonic Runge approximants from
  the successive differences, with summable errors in the successive `C^j(K_j)` seminorms; prove
  convergence to a smooth solution of `Δv = f` on all of `Ω`, componentwise for disconnected `Ω`.
- **From `Δ` to `∂̄`.** For scalar `f` solve `Δv = 4f`; then
  `∂̄(Σ_j (−1)^(j−1) ∂_(z_j)v dz̄_[j]) = f dz̄₁ ∧ ⋯ ∧ dz̄_n`, where `dz̄_[j]` omits `dz̄_j`. For the
  holomorphic-first `(p, q)` convention multiply the coefficientwise primitive by `dz_I` on the left
  and by `(−1)^p`. This proves surjectivity, hence closed range, of the top Dolbeault operator.

These Euclidean inputs are an independent construction before purity and compact duality.
*Needs:* Tau Ceti `IsOpen.exists_isFilledIn_compact_exhaustion`,
`InnerProductSpace.HarmonicOnNhd.analyticOnNhd`, `TauCeti.newtonianKernel`,
`TauCeti.planarNewtonianKernel` and their fundamental-solution theorems,
`TauCeti.PDE.existsUnique_isWeakSolutionDirichlet_laplacian_of_subset_ball`; Mathlib
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`; ComplexKahlerGeometry §5.3;
PseudodifferentialOperators §6.2.

**Checks.**
- `n = 1`, `f = 1`: `v = |z|²` has `Δv = 4`, and `∂_z v = z̄` has `∂̄z̄ = 1 = f`. Solving `Δv = f`
  instead of `Δv = 4f` would return `1/4`.
- The kernels: for `d = 3`, `E = −1/(4π‖x‖)`, the negative of Tau Ceti's `1/(4π‖x‖)`; for `d = 2`,
  `E = log‖x‖/(2π)` and `ΔE = δ`. Using Tau Ceti's kernel without the sign gives `Δw = −T`.

### 2.0b The Fréchet–Schwartz property of smooth sections

ComplexKahlerGeometry §5.3 supplies the global compact-open `C^∞` Fréchet topology on smooth
sections of every finite-rank bundle over a finite-dimensional, second-countable Hausdorff manifold.
Prove that it is Fréchet–Schwartz: embed it, by a countable chart and frame restriction family, as
the closed overlap-compatible subspace of a countable product of local smooth-section spaces; prove
the local Schwartz estimates (a set bounded for the `C^(m+1)` seminorm on a compact
neighbourhood of a compact `K` is precompact for the `C^m` seminorm on `K`, by Arzelà–Ascoli); and
prove that the restriction map is a topological isomorphism from this topology onto that closed
subspace. Construct the continuous differentials and their closed kernels on these carriers.
*Needs:* ComplexKahlerGeometry §5.3.

### 2.0c CurrentResolution: compact currents and Dolbeault regularization

For a finite-rank holomorphic bundle `E` on a complex `n`-manifold `X`, put
`𝓔_(p,r) = A^(n−p,n−r)(X, E*)` with the FS topology of §2.0b. The compact `(p, r)`-currents are
`𝓒_c^(p,r)(X, E) = StrongDual ℂ 𝓔_(p,r)`. Compare them, through the form and density pairing, with
ComplexKahlerGeometry §5.3's compact-distribution carrier and its strong/compact-dual comparison. A
compact smooth `(p, r)`-form `η` valued in `E` defines `T_η(α) = ∫ ev(η ∧ α)` for `α ∈ 𝓔_(p,r)`.
Define `(δ_r T)(α) = (−1)^(p+r+1) T(∂̄α)` on the complementary test degree; at `p = n` and `E`
trivial this is the scalar `(n, r)` convention. Prove compatibility with the smooth-form embedding
by Stokes, and compare the graded order of the pairing with §0.3's relative integration convention.

Write `𝓓_c^(p,r)(X, E)` for compactly supported smooth forms with their LF topology, and `𝓓_S` for
its stage of forms supported in a compact `S`. Prove that `𝓓_S` is a closed subspace of the global
smooth-section carrier and that its subspace topology equals the fixed-compact stage topology of the
chart and frame derivative seminorms, so `𝓓_S` is Fréchet. Consume ComplexKahlerGeometry §5.1's
bundle test spaces, their identification with the fixed-compact inductive limit and its universal
property, built on Mathlib's `TestFunction.continuous_iff_continuous_comp` in Euclidean charts, and
apply this criterion to the form carriers; this complex is different from the compact currents.
Construct the compact-support Dolbeault comparison with sheaf cohomology through currents, its
comparison with compact smooth forms, the integration pairings, and properly supported Dolbeault
regularization and chain homotopies.

**Local parametrices.** Construct them locally by convolution with cutoff Cauchy–Green parametrices
for `n = 1` and Bochner–Martinelli–Koppelman parametrices for `n ≥ 2` on `(0, q)`-forms, applied in
local `dz_I` and holomorphic frames of `Ω^p(E)`. For `|I| = p` transport the `(0, q)` homotopy by
`H_(Dol,p)(dz_I ∧ β) = (−1)^p dz_I ∧ H_Dol β`, since `∂̄(dz_I ∧ β) = (−1)^p dz_I ∧ ∂̄β`. If
`∂̄H_Dol + H_Dol∂̄ = id − R_Dol`, put `R_(Dol,p)(dz_I ∧ β) = dz_I ∧ R_Dol β` and prove
`∂̄H_(Dol,p) + H_(Dol,p)∂̄ = id − R_(Dol,p)`; the regularization carries no extra sign.

**Finite-colour chart refinement.** For `d = 2n` and every open cover of `X`, construct a countably
indexed locally finite open cover `(V_j)` refining it, with each `V_j` inside a coordinate domain
on which `Ω^p(E)` has a holomorphic frame, a colouring `c(j) ∈ {1, …, d + 1}` with
`V_j ∩ V_k = ∅` whenever `j ≠ k` and `c(j) = c(k)`, each `closure V_j` compact inside its assigned
open, and a same-index inner open cover `(O_j)` with `closure O_j` compact inside `V_j`. The route is
the covering dimension `d` of compact subsets of `ℝ^d` transferred through charts, and a continuous
partition of unity.

**Realified manifold inputs.** Use ComplexKahlerGeometry §3.1's real-analytic structure
`IsManifold 𝓘(ℝ, E₀) ω X`, lowered to `∞`, where `E₀` is the complex model space with
`FiniteDimensional ℂ E₀` and `finrank ℂ E₀ = n`, distinct from the bundle `E`. Mathlib's
`FiniteDimensional.complexToReal` and `finrank_real_of_complex` give `FiniteDimensional ℝ E₀` and
`finrank ℝ E₀ = 2n = d`; `ModelWithCorners.locallyCompactSpace` and
`ChartedSpace.locallyCompactSpace` give local compactness of `X`; `ModelWithCorners.isClosed_range`
supplies the closed model range. Local compactness with second countability gives σ-compactness,
and with Hausdorffness paracompactness, hence normality for the shrinkings and cutoffs below.
Plateau cutoffs come from Mathlib's `exists_contMDiffMap_zero_one_of_isClosed`.

**The global regularization.** With `W_j = O_j`, choose intermediate plateau opens and smooth real
cutoffs `φ_j`, `ψ_j` with `W_j ⋐ int{φ_j = 1}`, `supp φ_j ⊂ int{ψ_j = 1}` and `supp ψ_j` compact
inside its coloured chart member; supports are closed supports, and within each colour the
`supp ψ_j` are disjoint. In that chart and frame put `H_j = ψ_j H_(Dol,p),j(φ_j ·)` with its paired
transpose signs on currents. Prove the local kernels smooth off the diagonal and pseudolocal, with
parameter-dependent compact and derivative estimates and a smooth local remainder `R_Dol`. For each
colour `c` set `H_c = Σ_(j∈c) H_j` and `R_c = id − δH_c − H_cδ`; these sums are locally finite, and
each `H_c` and `R_c` has support proper in both kernel projections. With `N = d + 1` colours set
`R = R_N ⋯ R_1` and `H = Σ_(c=1)^N H_c R_(c−1) ⋯ R_1`, and prove `δH + Hδ = id − R` by finite
telescoping, keeping every cutoff commutator, together with both support-properness statements for
these finite compositions, the `∂̄` identities on smooth forms and the current identities with the
graded signs.

Each `R_c` regularizes only on its `W_j`: there the identity part of the commutator vanishes,
derivatives of `φ_j` are separated from `W_j`, and derivatives of `ψ_j` vanish nearby, so
off-diagonal smoothness and the smooth local remainder give joint smoothness of the row kernel.
Choose finitely many nested shrinkings still containing the inner cover. For right composition use
the continuous test-side transposes; for left composition split by near and far cutoffs and use
pseudolocality and off-diagonal smoothness. Prove all mixed kernel derivative estimates, verify the
row formulas by pairing with all compact currents, and glue them by separation into a jointly
smooth kernel `κ` for `R`, proper in both projections. In dimension `0` use the identity
comparison with `H = 0`. Apply the construction componentwise over the indexed components.
*Needs:* §§0.3, 2.0b; ComplexKahlerGeometry §§2.5, 3.1, 4.1, 5.1, 5.3; GlobalHolomorphicFunctions
§0.3 (compact-support Cauchy–Green); Mathlib as named.

**Checks.**
- On `ℂ`, the Cauchy–Green operator `Tφ(z) = (1/π) ∫ φ(ζ)/(z − ζ) dA(ζ)` satisfies `∂̄Tφ = φ` for
  compactly supported smooth `φ`; with the kernel `1/(ζ − z)` instead, `∂̄Tφ = −φ`.

### 2.0d CurrentTopologyBridge

**CurrentTopologyBridge.** For the strong-dual current carriers of §2.0c and the LF complex of
compactly supported smooth forms: on the complementary global smooth carriers construct the
continuous transpose-test operators of the parametrices of §2.0c, with §0.3's pairing signs, and for
each target compact and derivative order bound their seminorms by finitely many source seminorms on
one source compact. Define the current-to-current homotopies and regularizations as their signed
transposes; Mathlib's `ContinuousLinearMap.precomp` gives strong continuity, since a continuous
linear map sends bounded sets to bounded sets. Define extension by zero of compact currents along an
open inclusion as the transpose of continuous global smooth restriction, with its support and
integration laws.

For the smoothing regularization `R` prove also continuity into the LF carrier of compactly supported
smooth forms. Using the smooth kernel `κ` with both projections proper: for every source compact `K`
the output is supported in one compact `K′ ⊆ X`; for every continuous LF seminorm `q` let `Q_q` be its
equicontinuous polar in the continuous dual of the LF tests, and prove that the kernel transpose maps
`Q_q` to a bounded family `𝔅_q` in the complementary global smooth predual, because for each compact
subset of `X` and each derivative order the relevant kernel derivatives form a bounded family of LF
tests supported in one compact. Prove the distributional pairing interchange and
`q(RT) = sup_(λ∈Q_q) |T(R^t λ)| ≤ sup_(b∈𝔅_q) |T(b)|`; the right side is a strong-dual seminorm, so `R`
is continuous from compact currents into the LF carrier, and composing it with the smooth inclusion
gives the current-valued regularization. For LF-input regularization and homotopy, prove for each
support `K` an output support `K′` and, for each `C^m` seminorm there, a bound by one constant times a
finite higher-derivative seminorm on `K`; the LF final-topology criterion gives continuity. The
inclusion of smooth forms into currents is continuous on each compact stage by the integration
estimate against bounded smooth test families, hence on the LF limit. Prove the signed chain
identities in both complexes and their compatibility with the inclusion. These continuous
chain-homotopy comparisons induce the comparisons of the possibly non-Hausdorff quotient topologies
on the Stein and compact-complement domains used below, with the strong topology on currents and the
LF topology on compact smooth forms.
*Needs:* §2.0c; Mathlib `ContinuousLinearMap.precomp`, `TestFunction.continuous_iff_continuous_comp`.

### 2.0e FunctionalDuality: closed range, reflexivity and compact inductive limits

**Closed-range transposition.** For a continuous map of FS spaces prove that it has closed range
exactly when its transpose has weak-star closed range. First prove FS reflexivity,
`(F₀′_b)′_b = F₀` for an FS predual `F₀`; Hahn–Banach then identifies every strongly closed subspace
of `F₀′_b` with an intersection of kernels of pairings with `F₀`, so strongly and weak-star closed
subspaces agree. Prove the annihilator and strong-dual quotient identifications. For a finite FS
complex, verify both adjacent closed ranges before deriving the identification of the strong duals
of its cohomology with the cohomology of the reversed transpose DFS complex. This is the FS case of
[Komatsu, Theorem 19, p. 381 (1967)](https://doi.org/10.2969/jmsj/01930366). Every transpose sign is
fixed by §0.3's integration convention.

**Inputs from Mathlib and Banach space theory.** A Fréchet space is barrelled
(`BaireSpace.instBarrelledSpace`). For `WithSeminorms.banach_steinhaus` use the norm seminorm family on
the scalar codomain `ℝ` or `ℂ`; its conclusion is uniform equicontinuity, and the directed defining
seminorms of the domain give a bound by one `C p_j` with `C ≥ 0`. BanachSpaceTheory B1 supplies the
real and complex Banach adjoint `ContinuousLinearMap.precomp`, its norm and composition comparisons,
naturality of the canonical bidual embedding and norming; derive the isometry of the bidual
embedding from norming. Schauder's theorem (a map of real or complex Banach spaces is compact if and
only if its adjoint is) is Tau Ceti's. `StrongDual 𝕜 G₀` for `𝕜 = ℝ` or `ℂ` and `G₀` Fréchet is
complete by Mathlib's `ContinuousLinearMap.instCompleteSpace`, whose domain hypotheses
`IsTopologicalAddGroup G₀`, `ContinuousSMul 𝕜 G₀` and `SequentialSpace G₀` hold (metrizability gives
the last), with codomain `𝕜` uniform, complete, with continuous scalar multiplication. For the
compact-limit argument below construct the continuous linear comparisons `L′_b ≃ F` and
`L ≃ StrongDual ℂ F` for the projective Fréchet limit `F`; for each complementary smooth carrier
`𝓔_(p,r)` the compact-current model is exactly `StrongDual ℂ 𝓔_(p,r)`. Apply Mathlib's completeness
to the Fréchet domains `F` and `𝓔_(p,r)` (completeness of `F` comes from its projective construction),
prove each model comparison and its inverse uniformly continuous for the additive uniformities, and
transport completeness; this covers arbitrary Cauchy filters, with no first countability of the
duals assumed.

**The compact Banach-limit theorem.** Let `L` be a Hausdorff countable locally convex inductive limit
of complex Banach spaces `B_j` with compact injective continuous linear bonding maps, with its locally
convex final topology, and `F = lim_j B_j′` with its projective seminorms `p_j`. Then `F` is Fréchet,
the final topology identifies `L′` with `F` as vector spaces, and a finite family of seminorms is
dominated by a later `p_j` (Komatsu, Theorems 6′ and 12, pp. 375 and 377). BanachSpaceTheory B2's
Gantmacher criterion and compact-implies-weakly-compact give `T′′(X_B′′) ⊆ J_(Y_B)(Y_B)` for a
compact `T : X_B → Y_B`, with norm at most `‖T‖` times the bidual norm through B1's adjoint norm
comparison. A continuous functional on `F` bounded by `C p_j` extends by Hahn–Banach to an element
of `B_j′′` of norm `≤ C`; compatibility of the projective coordinates and factorization through the
next compact bonding map make it evaluation at a vector of
`B_(j+1)`, with the corresponding bound. No reflexivity of the stages is assumed.

Prove bounded regularity: each `x ∈ L` lies in a stage `B_k` with `|f(x)| ≤ p_k(f)‖x‖_k`, so `ev_x`
is continuous on `F`; for bounded `A ⊆ L` these evaluations are pointwise bounded, hence
equicontinuous on the barrelled `F` and bounded by one `C p_j`, and the factorization puts `A` in the
image of a bounded ball of `B_(j+1)`; Hausdorff local convexity and Hahn–Banach separation identify
the vectors with the original ones. So every bounded subset of `L` is contained and bounded in one
stage. With this, prove the strong-dual identification `a : L′_b ≃ F`; Schauder compactness of the
adjoint bonding maps makes `F` an FS space. With `F′_b := StrongDual ℂ F`, canonical evaluation
`ι : L → F′_b` is onto by the factorization and injective by separation; forward continuity follows
from continuity of each `B_j → F′_b` (a bounded `Q_F ⊆ F` has `sup_(Q_F) p_j < ∞`) and the final
topology; for inverse continuity take a closed absolutely convex zero neighbourhood `U ⊆ L`, whose
polar `U°` is bounded in `F`, and control the inverse by the strong seminorm of `U°` through the
bipolar identity `U°° = U`, proving this pairing and bipolar comparison explicitly. So
`ι : L ≃ StrongDual ℂ F` is a topological linear isomorphism, and `L` is complete through `ι`. Apply
Mathlib's `ContinuousLinearEquiv.arrowCongr a.symm (ContinuousLinearEquiv.refl ℂ ℂ)` to obtain
`F′_b ≃ StrongDual ℂ (L′_b)`, `λ ↦ λ ∘ a`; prove `(ι(x) ∘ a)(ℓ) = a(ℓ)(x) = ℓ(x)` for every `ℓ ∈ L′_b`,
so the composite is canonical evaluation `L ≃ (L′_b)′_b`, natural in continuous linear maps.

**FS and DFS.** For every FS space `F₀` construct the DFS strong dual `F₀′_b` and prove that canonical
evaluation `F₀ ≃ (F₀′_b)′_b` is a topological linear isomorphism, and that the canonical bidual map of
`F₀′_b` is the inverse of the strong transpose of this evaluation. Together these identify each DFS
space used here with the strong dual of its FS strong dual. Prove stability of FS and DFS under the
closed subspaces and separated quotients used here, the DFS open mapping theorem, and the
quotient-to-image isomorphism of a closed-range map: for a continuous DFS bijection `T`, transpose to
the FS preduals and identify `(T′)′` with `T` by reflexivity; the closed-range theorem makes `im T′`
closed, its annihilator is `ker T = 0` so it is dense, so `T′` is onto, and injective because `T` is
onto; Fréchet open mapping and transposing the inverse give continuity of `T⁻¹`. For a surjection,
first pass to its closed-kernel DFS quotient. These constructions precede real-support purity.
*Needs:* §2.0b; Mathlib as named; Tau Ceti `ContinuousLinearMap.isCompactOperator_precomp_iff`;
BanachSpaceTheory B1 and B2.

**Checks.**
- `B_j = ℂ` for every `j`, with identity bonding maps (compact, as `ℂ` is finite-dimensional):
  `L = ℂ`, `F = ℂ`, and every map in the theorem is the identity. With bonding maps the identity of
  an infinite-dimensional Banach space the bonding maps are not compact and `F` is not FS: the
  compactness hypothesis is not decorative.

### 2.0f SteinBundleDuality

**SteinBundleDuality.** For every Stein `n`-manifold `V` and every finite-rank holomorphic bundle `E`
on `V`: `H_c^q(V, Ω^p(E)) = 0` for `q < n`, and `H_c^n(V, Ω^p(E))` is Hausdorff and isomorphic to
`O(V, Ω^(n−p)(E*))′_b` by the integration pairing, with its closed-range statements and
functoriality. Use RealAnalyticGeometry R3.2's Cartan B on the global smooth Dolbeault resolution on
the bundle Fréchet carrier, which is FS by §2.0b: each positive-degree kernel is the
preceding image, so that image is closed. Apply §2.0e, checking both adjacent closed ranges, to the
global compact-current transpose complex and its integration pairing. The scalar case is its
specialization. ComplexKahlerGeometry §5.10's Serre duality on compact manifolds is a different
theorem. Treat `n = 0` directly. This theorem does not use purity.
*Needs:* §§2.0b, 2.0c, 2.0e; RealAnalyticGeometry R3.2.

### 2.1 FlatCompactAnalyticDuality

**FlatCompactAnalyticDuality.** For every `n ≥ 1`, every compact `K ⊆ ℝⁿ ⊆ ℂⁿ` and every open complex
neighbourhood `V` of `K`: `H^q_K(V, O) = 0` for `q ≠ n`, and there is a natural complex-linear
isomorphism `Hⁿ_K(V, O) ≃ A[K]′`, where `A[K]` is the locally convex inductive limit of holomorphic
functions on neighbourhoods of `K` (§2.1a) and the prime is the continuous dual (Martineau's theorem
in Honda–Izawa–Suwa, Theorem 6.10, p. 22; its hypothesis holds for real `K`, p. 23). Fix
`dz₁ ∧ ⋯ ∧ dz_n` and §0.3's relative integration and normal orientation to identify the dual
analytic `n`-form germs. This isomorphism is algebraic on the supported cohomology group; its strong
quotient topology comparison is a target of §2.3. For `K ⊆ L`, prove that `Hⁿ_K → Hⁿ_L` is exactly
the continuous transpose of `A[L] → A[K]`, using the integration pairing and the natural support
maps; an abstract
identification of vector spaces without this compatibility does not serve the purity argument of
§2.1c. Sections 2.1a–2.1b prove it.
*Needs:* §§2.1a, 2.1b.

### 2.1a Compact neighbourhoods, tautness and the germ topology

For `K = ∅` put `A[K] = 0` and prove all `K`-supported groups zero directly; then the ordinary and
compactly supported groups of `V ∖ K = V` are `H^q(V, O)` and `H_c^q(V, O)`. In the remaining
arguments `K` is nonempty.

Every compact `K ⊆ ℝⁿ` is polynomially convex, and a nonempty compact polynomially convex `K` has,
inside any open `U ⊇ K`, a polynomial polyhedron `P = closedBall(0, R) ∩ ⋂_i {|p_i| ≤ 1}` with `R > 0`,
finitely many nonconstant `p_i`, `K ⊆ int P` and `P ⊆ U`; `P` is compact and polynomially convex and
`int P = {‖z‖ < R, |p_i(z)| < 1 for all i}`. Here the norm on `ℂⁿ` is the sup norm, so the balls are
polydiscs, and `ψ(z) = Σ_k −log(1 − |z_k/R|²) + Σ_i −log(1 − |p_i(z)|²)` is a smooth strictly
plurisubharmonic exhaustion of `int P` with compact sublevel sets. All of this is Tau Ceti's. Prove
that `int P` is Stein by RealAnalyticGeometry R3.1's strictly psh exhaustion criterion; with R3.1's
Oka–Weil approximation and R3.2's Cartan B on this cofinal system, it is the system of Stein
neighbourhoods used below.

**Compact tautness.** For a compact `K` in a paracompact Hausdorff complex manifold, a sheaf `F` and
`q ≥ 0`, construct the natural comparison `colim_(U⊇K) H^q(U, F) ≃ H^q(K, F|_K)`, with naturality for
shrinking neighbourhoods and inclusions of compacts, using finite-cover refinements, the paracompact
Čech/derived comparison and exact filtered colimits. Cartan B on the cofinal Stein neighbourhoods then
gives `H^q(K, O|_K) = 0` for `q > 0`, used in the compact-support sequence of §2.1b.

**The germ topology.** Identify the inductive-limit topology of `A[K]` with that of a cofinal system of
bounded holomorphic Banach stages `H^∞(U_j)`, with `K ⊆ U_(j+1)`, `closure U_(j+1) ⊆ U_j` and every
`U_j` relatively compact in `V`, chosen cofinal near `K` with the components missing `K` removed.
Restriction is injective by the identity theorem and compact by Cauchy estimates and Montel's
theorem. The germ limit is Hausdorff: every point-jet evaluation at a point of `K` is continuous by
Cauchy estimates, and a germ all of whose jets vanish at every point of `K` is zero by Taylor
expansion. Apply §2.0e's compact Banach-limit theorem to obtain the DFS property, bounded regularity,
completeness, the FS strong dual and the natural strong-bidual isomorphism. Prove independence of the
cofinal Banach system and agreement with the compact-open inductive limit of holomorphic germs.
*Needs:* §2.0e; Tau Ceti's polynomial hulls, polyhedra and exhaustion (supplier contracts);
RealAnalyticGeometry R3.1 and R3.2; ComplexKahlerGeometry §2.5 for the Čech/derived comparison.

**Checks.**
- For `K = [−1, 1] ⊆ ℂ` and `z = i`: `exp(−itz)` has modulus `1` on `K` and `e^t > 1` at `i`, for
  `t > 0`; this is the separator that polynomial approximation turns into a polynomial. The unit
  circle, which is not in `ℝ`, is not polynomially convex: its hull is the closed disc.
- For `n = 1`, `P = closedBall(0, 2)` with no polynomials has `ψ(z) = −log(1 − |z|²/4)`, which tends
  to `∞` at `|z| = 2`, so its sublevel sets in the open disc are compact.

### 2.1b Compact supports and all closed-range degrees

Take a Stein neighbourhood `V` of `K`, put `Ω = V ∖ K`, and fix `dz₁ ∧ ⋯ ∧ dz_n` to identify the
canonical line with the scalar sheaf. Use the compact-current resolution of §2.0c and the
compact-support sequence for `K ⊆ V`, constructed from the c-soft current resolution and cutoffs,

```
… → H_c^r(Ω, O) → H_c^r(V, O) → H^r(K, O|_K) → H_c^(r+1)(Ω, O) → …
```

and prove continuity of extension by zero and of the connecting maps, and their integration
naturality. For `n ≥ 2`, compact tautness and §2.0f give algebraically

```
A[K] ≃ H_c^1(Ω, O),
H_c^r(Ω, O) = 0  for r ≠ 1, n,
H_c^n(Ω, O) ≃ H_c^n(V, O).
```

Prove the required topologies without presuming these algebraic isomorphisms topological. In the
scalar case put `𝓔_sm^q(Ω) = A^(0,q)(Ω) = 𝓔_(n,n−q)(Ω)` for the global smooth `(0, q)`-form FS
carrier, distinct from the germs `A[K]` and from `A_M`, and `d_q = ∂̄ : 𝓔_sm^q(Ω) → 𝓔_sm^(q+1)(Ω)`. Use
`𝓒_c^(n,r)(Ω, ℂ) = StrongDual ℂ 𝓔_sm^(n−r)(Ω)` and
`δ_r = (−1)^(n+r+1) (d_(n−r−1))′ : 𝓒_c^(n,r)(Ω, ℂ) → 𝓒_c^(n,r+1)(Ω, ℂ)` with the right-wedge pairing
convention of §2.0c. For `2 ≤ r ≤ n − 1` the vanishing of `H_c^r` gives `im δ_(r−1) = ker δ_r`, a closed
DFS subspace. MalgrangeTopVanishing makes `d_(n−1)` onto, so §2.0e gives closed `im δ_0`. Extension
by zero to `V` followed by the Hausdorff Stein quotient `H_c^n(V, O)` is continuous on top currents,
and the last algebraic isomorphism identifies its kernel with `im δ_(n−1)`, which is therefore
closed. By FS reflexivity these strongly closed current images are weak-star closed, so
transposition gives closed range of every `d_(j−1)` with target degree `j = 1, …, n`. Both top
compact-cohomology spaces are then DFS, and their natural continuous bijection is a topological
isomorphism by DFS open mapping. For `n = 2` the intermediate range is empty and both endpoint
arguments remain.

The compact-current quotient giving `H_c^1(Ω, O)` is DFS by §2.0e. Construct the connecting map
`A[K] → H_c^1(Ω, O)` on each Banach germ stage by `f ↦ [∂̄(χf)]` in the scalar Dolbeault resolution,
with `χ` compactly supported in that stage's neighbourhood and equal to `1` near `K`; its derivative
is supported in `Ω`. Compare with the `(n, •)` current resolution through the `dz` trivialization:
`∂̄(dz ∧ β) = (−1)^n dz ∧ ∂̄β`, so `Φ_q(β) = (−1)^(nq) dz ∧ β` is a chain map from the scalar Dolbeault
complex to the `(n, •)` complex. Prove cutoff independence. With `S = supp ∂̄χ ⊆ Ω` compact, Cauchy
estimates on `S` bound every derivative of `(∂̄χ)f` by the stage norm, giving continuity into
`𝓓_S^(n,1)(Ω, ℂ)` through `Φ`; compose with the LF inclusion, the continuous smooth-to-current map of
§2.0d and the current quotient map, and pass to the germ limit. This is a continuous bijection of DFS
spaces, hence a topological isomorphism by DFS open mapping.

Apply §2.0e's finite-complex duality to obtain `H^p(Ω, O)′_b ≃ H_c^(n−p)(Ω, O)` with the integration
pairing of `(0, p)`-forms and `(n, n−p)`-currents. The top compact-support map and FS reflexivity
identify `O(V)` with `O(Ω)`, and the intermediate vanishings kill `H^p(Ω, O)` for `1 ≤ p ≤ n − 2`.
Both ranges adjacent to degree `n − 1` are closed, so `H^(n−1)(Ω, O)` is a Hausdorff FS quotient and
reflexive, and dualizing `H^(n−1)(Ω, O)′_b ≃ A[K]` gives `H^(n−1)(Ω, O) ≃ A[K]′_b`. The support sequence
supplies compact concentration and the continuous analytic-functional dual. On Stein `V`,
`Hⁿ_K ≃ H^(n−1)(V ∖ K)` is used only for `n ≥ 2`.

For `n = 1`, `d_0` is onto by MalgrangeTopVanishing and its transpose has closed image. Keep instead
the exact sequence `0 → A[K] → H_c^1(V ∖ K, O) → H_c^1(V, O) → 0`, and prove the Cauchy and Laurent
duality for `O(V ∖ K)/O(V)` directly, including closedness of the restriction image `O(V)`, its
continuous-dual pairing, signs and naturality. The two exceptional compact-support degrees have
coalesced, so `A[K]` is not all of `H_c^1(V ∖ K, O)`.

For every `n ≥ 1` and every open complex neighbourhood `W` of `K`, choose a smaller Stein `V` with
`K ⊆ V ⊆ W`, apply §0.1's excision `H^q_K(W, O) ≃ H^q_K(V, O)` in every degree, and prove its
compatibility with support maps and the analytic-functional pairing. This extends the supported-group
conclusions of both cases to arbitrary `W`; ordinary complement cohomology keeps its Stein hypotheses.
*Needs:* §§0.1, 2.0a, 2.0c–2.0f, 2.1a; MalgrangeTopVanishing.

**Checks.**
- `n = 1`, `K = {0}`, `V` the unit disc: `H¹_{0}(V, O) ≅ O(V ∖ 0)/O(V)`, the principal parts
  `Σ_(k≥1) a_k z^(−k)` convergent on `ℂ ∖ 0`, and the class of `z^(−k−1)` pairs with the germ `z^m` to
  `2πi` times `δ_(km)` under the residue pairing: the dual of the germs at `0` is the space of these
  principal parts.

### 2.1c Dense germs and RealSupportPurity

**Dense germ restriction.** For real compacts `K ⊆ L`, `A[L] → A[K]` has dense image: for a germ `f`
near `K` choose a polynomially convex compact `P` with `K ⊆ int P ⊆ P ⊆ domain f` (§2.1a); Oka–Weil
approximation uniformly on `P` gives compact-open convergence on `int P`, Cauchy estimates give
convergence of all derivatives on smaller compacts, and the continuous map to `A[K]` gives germ
convergence; polynomials extend near `L`. Hence the continuous transpose `A[K]′ → A[L]′` is
injective.

**RealSupportPurity.** For a relatively compact real open `Ω ⊆ ℝⁿ` put `L = ∂Ω`, `K = closure Ω`, and
use the support triangle `RΓ_L(V, O) → RΓ_K(V, O) → RΓ_(K∖L)(V ∖ L, O)`; the locally closed support
`Ω` is closed in `V ∖ L`, not in `V`. Compact concentration (§2.1) leaves only a possible kernel in
degree `n − 1`; naturality identifies it with the kernel of `A[L]′ → A[K]′`, which is zero by dense
germ restriction. Excise to complex neighbourhoods `W` with `W ∩ ℝⁿ = Ω` and use exact filtered
colimits of stalks. This proves `𝓗^q_M(O) = 0` for `q < n`.

**The upper bound.** For a real-centred polydisc `D` and `I = D ∩ ℝⁿ`, the `n` sets
`V_j = D ∩ {Im z_j ≠ 0}` cover `D ∖ I`, and every finite intersection of them is a product of open
subsets of `ℂ`. Prove that `O` and `Ω^p` have no cohomology in positive degrees on a product of open
subsets of `ℂ`, by the one-variable `∂̄` solver with holomorphic parameters, induction on the number of
factors and exhaustion. The finite Čech length then gives support degree at most `n`, and local frames
give `𝓗^q_M(Ω_X^p) = 0` for `q ≠ n` and `0 ≤ p ≤ n` (Honda–Izawa–Suwa, Theorem 2.14(1) and the remark
after Definition 2.15, p. 8, quoting the classical theorem). For `M = ℝⁿ ⊆ ℂⁿ` the scalar statement is
`isZero_supportedModuleHSheaf_realLocus`, stated with the real locus `realLocus` and the sheaf of
holomorphic functions `holomorphicSheaf` on `ℂⁿ`.

**Global consequences.** §0.1's support truncation, Cartan B on `D` and the support sequence give, for
`n ≥ 2`, `O(D) ≃ O(D ∖ I)` and `H^q(D ∖ I, O) = 0` for `1 ≤ q ≤ n − 2`. Export the augmented finite Čech
complex of the cover `(V_j)`, with alternating restriction differential, as exact below its top
degree: a compatible degree-`0` family comes from a unique function in `O(D)`, and every positive-degree
cocycle in the displayed vanishing range is a coboundary; derive these from the purity theorem. In
dimension `1` the lower vanishing is `q = 0`; compute the top quotient on its Čech carrier, whose
noncompact restriction image need not be closed. Treat dimension `0` directly. Apply §0.1's edge
comparison to identify `B(U)` with twisted relative `Hⁿ` for every open `U`.
*Needs:* §§0.1, 2.1, 2.1a; RealAnalyticGeometry R3.1 (Oka–Weil) and R3.2 (Cartan B);
ComplexKahlerGeometry §2.3 (the parameter-dependent one-variable solver) and §2.4;
GlobalHolomorphicFunctions §7.1.

**Checks.**
- `n = 1`, `D` the unit disc: `V_1 = D ∖ ℝ`, and `𝓗⁰_ℝ(O) = 0` because a holomorphic function vanishing
  off `ℝ` vanishes; `𝓗¹_ℝ(O)` at `0` is the space of germs of `O(D ∖ ℝ)/O(D)` as `D` shrinks, nonzero
  since it contains the class of `1/z`.
- `n = 2`: the intersection `V_1 ∩ V_2` is a product of two disconnected half-disc pairs, with four
  components; a definition of the cover by `{Im z ≠ 0}` in one coordinate only would not cover
  `D ∖ ℝ²`.

### 2.2 Flabbiness

**Flabbiness.** For opens `U ⊆ V ⊆ ℝⁿ` put `W = ℂⁿ ∖ (ℝⁿ ∖ V)` and `Z = V ∖ U`, closed in `W`. The long
exact sequence, MalgrangeTopVanishing on `W ∖ Z` and the Dolbeault degree bound on `W` give
`H^(n+1)_Z(W, O) = 0`. Purity's degenerate edge comparison identifies it with `H¹_Z(V, 𝓗ⁿ_V(O))`, and
the support sequence then makes `B(V) → B(U)` onto (Honda–Izawa–Suwa, Theorem 2.14(2), p. 8). This
works in every real chart. FlasqueLocality (Tau Ceti) gives global flabbiness of the untwisted
cohomology sheaves, of their orientation twists, of hyperforms and of `B(E)`: each twist and each
bundle is locally a finite trivial sum. For an
arbitrary closed `Z ⊆ M` in a Stein neighbourhood `W` in the complexification, derive
`H^q_Z(W, Ω_W^p) = 0` for `q > n` from purity and flasque supported-section acyclicity. Noncompact `M` and
all opens are included, not only compact supports. For `M = ℝⁿ` the scalar statement is
`isFlasque_supportedModuleHSheaf_realLocus`: `𝓗ⁿ_(ℝⁿ)(O)` is flasque on `ℂⁿ`, equivalently, since it
is supported on `ℝⁿ`, its restriction to `ℝⁿ` is.
*Needs:* §§0.1, 2.0a, 2.1c; Tau Ceti `TopCat.Sheaf.isFlasque_of_locally_flasque`,
`TopCat.Sheaf.isFlasque_of_locally_iso_pi`.

### 2.3 ManifoldBundleCompactDuality

**ManifoldBundleCompactDuality.** For every compact `K` in a real-analytic `n`-manifold `M`, use
RealAnalyticGeometry R3.0's complexification germ and Grauert's strictly psh function `p`
(`p ≥ 0`, `p^(−1)(0) = M`), and R3.1's Stein-neighbourhood and approximation interfaces, to construct
cofinal relatively compact Stein neighbourhoods `V_j` of `K` with `closure V_(j+1) ⊆ V_j`, every
component meeting `K`, and `K` `O(V_j)`-convex. This roadmap owns the compact totally real
neighbourhood lemma, the comparison of holomorphic convexity notions, and continuity of chart
transition and germ restriction maps. Construct the inductive limits of analytic germs on this
cofinal system, and prove independence of the neighbourhoods and of the complexification. Neither
compactness of `M` nor a global bound on the rank across components is assumed.

Consume §2.0f (the general noncompact Stein bundle theorem, whose scalar case §2.1 uses) and transport
its pairing and separated-quotient comparisons to these neighbourhoods; for compact real-support
complements use §2.1b's separate dimension-one Cauchy quotient and closedness of its restriction
image, also for form coefficients in local trivializations. Upgrade the flat compact duality of §2.1
to the Hausdorff strong-dual comparison and transport it through finite chart descent, using cup
product and §0.3's relative integration signs; prove the restriction and support maps continuous for
their quotient and strong-dual topologies, and every limit and quotient exactness used. This gives
**Martineau duality** (for `M` open in `ℝⁿ`: Honda–Izawa–Suwa, Corollary 6.12, p. 23):
hyper-`p`-forms supported in `K` are the strong continuous dual of germs along `K` of analytic
`(n−p)`-forms twisted by `or_M`, and scalar hyperfunctions supported in `K` pair with
germs of analytic densities. Prove nondegeneracy, surjectivity, excision and naturality in
coordinates and densities. This is the manifold and topological enhancement of the flat theorem and
is not an input to purity.

For finite-rank analytic bundle coefficients `E` use R3.1's finite generation of holomorphic bundles
near `K` and split the resulting surjection on a smaller Stein neighbourhood by R3.2's Cartan B
(applied to the bundle of homomorphisms into the kernel). Transfer the scalar pairing through this
finite split presentation, pair `B(E)` with germs of analytic `E*`-valued densities, and prove
independence of the presentation and compatibility with restrictions and transition maps, separately
on each fixed-rank component. Export flasqueness (`TopCat.Sheaf.IsFlasque`), all-open extension,
restriction kernels and acyclicity through §0.1's underlying-abelian and module comparisons. Prove
the dimension-`0` statements directly on the discrete sheaf.
*Needs:* §§0.3, 2.0f, 2.1, 2.1b, 2.1c; RealAnalyticGeometry R3.0, R3.1, R3.2.

### Examples

For `n = 1` and `K = {0}`, the analytic functionals at `0` are the series `Σ_k c_k φ^(k)(0)` with
`|c_k| ≤ C_ε ε^k / k!` for every `ε > 0`; `Σ_k φ^(k)(0)/(k!)²` (§5.2) is one, and it has infinite
order, so it is not a distribution. For `M = ℝⁿ`, flabbiness extends `bv₊ exp(1/z²)` on `ℝ ∖ 0` to
`ℝ` (§5.3).

### Dependencies

Layers 0 and 1; RealAnalyticGeometry R3.0–R3.2; ComplexKahlerGeometry §§2.3–2.5, 3.1, 4.1, 5.1, 5.3;
GlobalHolomorphicFunctions §§0.3, 7.1; PseudodifferentialOperators §6.2; BanachSpaceTheory B1, B2;
Tau Ceti's exhaustion, harmonic analyticity, Newtonian kernels, weak Poisson problem, Schauder's
theorem, polynomial hulls and flasque locality.

## Layer 3: analytic operations and boundary values

Honda–Izawa–Suwa fixes the relative representatives used for the operations.

### 3.1 Supports and analytic differential operators

Define the support of a section of `B_M`, `B(E)` and the hyperforms, and prove that it is closed,
compatible with restriction, and that a section vanishes on an open set exactly when its support is
in the complement (the relatively closed kernel criterion). Construct the sheaf of analytic
finite-order differential operators and its action on `B(E)`, with linearity, unit, composition,
Leibniz, restriction and coordinate laws. Coordinate partial derivatives act on relative
representatives.
*Needs:* Layer 1; §2.2 for the kernel criterion on all opens.

### 3.2 Hyperforms and their differential

Prove `B_M ⊗_(A_M) Ω_M^p ≃ B_M^(p)` with **right placement of the form**:
`[(α, β)] ⊗ ω ↦ [(α ∧ ω, β ∧ ω)]`. In this convention the hyperform differential is
`[(α, β)] ↦ (−1)^n [(∂α, −∂β)]` (Honda–Izawa–Suwa, (6.4), p. 20). Prove that it squares to zero,
the comparison with the analytic de Rham complex, Leibniz and its coordinate laws. An equivalent
left-placement convention has its degree-dependent signs transported explicitly through this map.
*Needs:* §§0.2, 1.1, 1.4.

### 3.3 Conjugation and external products

For `c(z) = z̄` let `κ = c*` followed by conjugation of coefficients on relative forms. In normal
coordinates `y`, conjugation of hyperfunctions is `[(α, β)] ⊗ or_y ↦ (−1)^n [κ(α, β)] ⊗ or_y`. Prove
that this is an antilinear involution extending conjugation of analytic functions, compatible with
orientation transitions and restrictions, whose fixed points are the real sections, and that it
commutes with the hyperform differential. Construct external products `b ⊠ c` on `M × N` and prove
their support, symmetry, associativity and density sign laws.
*Needs:* §§0.2, 0.3, 3.2.

**Checks.**
- `n = 1`: `1 = [(0, −1_upper)] ⊗ or_y` (§3.6). `κ` moves `−1_upper` to `−1_lower`, and with the sign
  `(−1)^n = −1` the image is `[(0, 1_lower)] ⊗ or_y = bv₋1 = 1`. Without the sign the conjugate of the
  real hyperfunction `1` would be `−1`.

### 3.4 Pullback under analytic submersions

By the analytic rank theorem an analytic submersion is locally a projection `p : N × M → M`; there put
`p*b = 1_N ⊠ b`, and prove independence of the local product coordinates, compatibility with
composition and chart gluing. Local diffeomorphisms are included. The scalar module is the analytic
sheaf `A_M`. Pullback under general analytic maps with an analytic noncharacteristic condition, and
the resulting admissible same-variable products, are in Layer 3a.
*Needs:* §3.3.

### 3.5 Boundary values from wedges

Let `U ⊆ ℝⁿ` be open, `Γ ⊆ ℝⁿ` a nonempty open convex cone invariant under positive scalars with
`0 ∉ Γ` and `Γ ∩ (−Γ) = ∅`, and `r : U → (0, ∞)` continuous; put `W = {x + iy : x ∈ U, ‖y‖ < r(x)}` and
its wedge `{x + iy ∈ W : y ∈ Γ}`. Choose an open inner cone `Γ₀` whose angular closure is compact in
`Γ`. On the oriented sphere `S^(n−1)` choose a smooth top-degree form `ψ` supported in `Γ₀ ∩ S^(n−1)`
with integral `1`, and pull it back by `y ↦ y/‖y‖`. For `n = 1` use the oriented `0`-sphere: `ψ = 1` on
the upper direction for an upper cone, `ψ = −1` on the lower direction for a lower cone, and zero on
the other. Then `(0, −ψ)` is the relative de Rham Thom representative normalized by the normal
orientation `y` and `R₀₁ = −∂R₁` (Honda–Izawa–Suwa, Corollary 3.12, p. 11).

For a holomorphic function `f` on the wedge, with no growth condition, define
`bv_Γ(f) = [(0, −f ψ^(0,n−1))] ⊗ or_y`, extending the second component by zero outside the inner
wedge in `W ∖ U` (Honda–Izawa–Suwa, Lemma 7.10 and the definition of `b_Ω` after Example 7.14,
pp. 28–30). Prove that this extension is smooth there, that it is a relative Dolbeault cocycle,
and that the projection of the Thom class has the analytic-function normalization. Two normalized
angular forms differ by `d` of a compactly supported form on a common inner angular cone; construct
that primitive and project its product with `f` to obtain the explicit relative coboundary. Prove
refinement of cones and radii, restriction, analytic coordinate transport, linearity, and
compatibility with analytic multiplication and differentiation. A holomorphic extension of `f`
through `U` gives its analytic section. This representative is the one used by every boundary-value
statement below.
*Needs:* §§0.2, 0.3, 1.1, 3.2.

### 3.6 Boundary values in dimension one

In dimension `1` write quotient classes as `(f₊, f₋)` modulo germs extending through `U`, read as
`bv₊f₊ − bv₋f₋`. The relative-to-quotient map is `[(0, g)] ⊗ or_y ↦ [(−g₊, −g₋)]`. Prove the four
normalizations

```
bv₊f = [(f, 0)]                       ↔ [(0, −f·1_upper)] ⊗ or_y,
bv₋f = [(0, −f)]                      ↔ [(0, f·1_lower)]  ⊗ or_y,
1    = [(1, 0)]                       ↔ [(0, −1_upper)]   ⊗ or_y,
δ    = [(−1/(2πiz), −1/(2πiz))]       ↔ [(0, 1/(2πiz))]   ⊗ or_y.
```

The last class is the residue-normalized point class; Layer 4 identifies it with the distribution
`δ` after constructing the embedding, and Tau Ceti's `Distribution.cauchyTransform_delta_zero` gives
the Cauchy transform of `δ` as `−1/(2πiz)` on both half-planes.
*Needs:* §§1.3, 3.5.

**Checks.**
- The relative-to-quotient map sends each right-hand side to its left-hand side: `[(0, −f·1_upper)]`
  goes to `[(f, 0)]`, `[(0, f·1_lower)]` to `[(0, −f)]`, `[(0, −1_upper)]` to `[(1, 0)]`, and
  `[(0, 1/(2πiz))]` to `[(−1/(2πiz), −1/(2πiz))]`. The map without the sign, `[(0, g)] ↦ [(g₊, g₋)]`,
  would send `bv₊f` to `−bv₊f`.
- `δ = (bv₋(1/z) − bv₊(1/z))/(2πi)`: with the conventions above this is
  `[(0, −1/z) − (1/z, 0)]/(2πi) = [(−1/(2πiz), −1/(2πiz))]`, the displayed class.

### Examples

`bv₊(1/z) − bv₋(1/z) = [(1/z, 1/z)] = −2πiδ`, the classical `1/(x + i0) − 1/(x − i0) = −2πiδ`. The
classes `[(1, 0)] = bv₊1` and `[(0, −1)] = bv₋1` are equal, since their difference `[(1, 1)]` extends
across every `U`: both are the analytic function `1`.

### Dependencies

Layers 0–2. Nothing of Layers 3a–5 is used.

## Layer 3a: microfunctions and analytic noncharacteristic operations

Sato–Kawai–Kashiwara, "Microfunctions and pseudo-differential equations", in *Hyperfunctions and
Pseudo-Differential Equations*, Lecture Notes in Mathematics 287 (1973), 265–529, for microfunctions,
analytic wavefronts and noncharacteristic operations; Kashiwara–Schapira, *Sheaves on Manifolds*,
Chapters III–IV, for conic sheaves, specialization and the Fourier–Sato transform. This layer
constructs their sheaf, cochain and geometric-functor prerequisites before using these operations.
It works on the real-analytic cotangent bundle and the complement of its zero section, and constructs
the analytic microlocal condition for hyperfunctions; PseudodifferentialOperators' smooth wavefront
condition for distributions keeps its separate carrier and meaning.

### 3a.1 Conic sheaves and geometric derived functors

Use Mathlib's `DerivedCategory.Plus` for bounded-below complexes of sheaves of complex vector spaces
and `Functor.rightDerivedFunctorPlus`, with §0.1's abelian, sheafification, enough-injectives and
localization comparisons. Extension by zero `j_!` along an open inclusion `j : U → X` is Mathlib's
`Functor.sheafPullback` along `Over.forget U`, which Tau Ceti proves exact
(`TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback` for abelian sheaves,
`SheafOfModules.preservesFiniteLimits_pullback_over` for sheaves of modules); §0.1's coefficient
comparison carries it to sheaves of complex vector spaces. ComplexComparisonPartII §C6.1, with
coefficient ring `ℂ`, supplies the stalk and section formulas of `j_!`, c-soft resolutions, derived
compact-support sections, the support localization triangle, and the derived direct image with proper
supports `Rf_!` (built from sections over `V` whose support is proper over `V`) for locally proper
separated continuous maps between paracompact, locally contractible, locally compact Hausdorff spaces,
with composition, proper agreement and base change. The spaces used here are finite-dimensional
manifolds, possibly with boundary, and every continuous map between them is separated and proper on a
compact neighbourhood of each point of its source, so §C6.1 applies.

Direct and inverse image are Mathlib's `TopCat.Sheaf.pushforward` and `TopCat.Sheaf.pullback`; for
abelian sheaves inverse image is exact by Mathlib's
`Functor.sheafPullbackConstruction.preservesFiniteLimits` (the preimage map on opens is
representably flat) and direct image along a closed embedding by Tau Ceti's
`TauCeti.Topology.preservesFiniteColimits_pushforward_of_isClosedEmbedding`; prove that both
exactness statements pass to sheaves of complex vector spaces, whose exactness is detected on the
underlying abelian sheaves. Tensoring with the constant sheaf of a locally closed subset is exact;
prove the flatness and restriction comparisons this uses. Construct the natural transformations
between these functors and `Rf_!`, and prove the projection formula for tensor products and the
proper-support Fubini comparison used by the transforms below. Prove the finite
cohomological-dimension bounds on Euclidean fibres and transfer them through locally finite charts.
These functors extend §0.1's ordinary direct image and supported sections.
*Needs:* §0.1; Mathlib `DerivedCategory.Plus`, `Functor.rightDerivedFunctorPlus`,
`Functor.sheafPullback`, `TopCat.Sheaf.pushforward`, `TopCat.Sheaf.pullback`,
`Functor.sheafPullbackConstruction.preservesFiniteLimits`; Tau Ceti
`TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback`,
`SheafOfModules.preservesFiniteLimits_pullback_over`,
`TauCeti.Topology.preservesFiniteColimits_pushforward_of_isClosedEmbedding`; ComplexComparisonPartII
§C6.1.

### 3a.2 The Fourier–Sato transform

For a real vector bundle `V → M` of rank `d`, construct the category of conic derived sheaves: objects
invariant under positive fibre dilations, with the action, unit and composition isomorphisms. On
`V ×_M V*` put `P = {(v, η) : η(v) ≤ 0}` and define the fibrewise Fourier–Sato transform
`F^∧ = Rp₂!((p₁⁻¹F)_P)`, where `(−)_P` is the tensor product with the constant sheaf on the closed set
`P` extended by zero. Prove conicity, naturality under restriction and base change, compatibility with
distinguished triangles and shifts. Construct the inverse transform and prove
`F^∧∧ ≃ a⁻¹F ⊗ or_(V/M)[−d]`, with `a` the fibre antipodal map and the orientation line complexified.
Compute the compactly supported cohomology of the half-space fibres and of their two-transform
intersections, including `d = 0`, the zero vector and the boundary cases, to construct the inversion
maps and prove that their composites are identities; these fibre computations, base change and Fubini
are the proof of inversion, not an assumed integral formula.
*Needs:* §§0.3, 3a.1.

**Checks.**
- `d = 1`, `M` a point, `F` the constant sheaf on the closed half-line `{v ≥ 0}` extended by zero:
  for `η > 0` the fibre `{v ≥ 0 : ηv ≤ 0} = {0}` has compactly supported cohomology `ℂ` in degree `0`;
  for `η ≤ 0` it is the half-line `{v ≥ 0}`, whose compactly supported cohomology vanishes. So `F^∧` is
  the constant sheaf on the open half-line `{η > 0}` extended by zero. With the inequality `η(v) ≥ 0`
  in place of `≤ 0` it would be the open half-line `{η < 0}`.

### 3a.3 Specialization and microfunctions

Consume Tau Ceti's normal bundle of an embedding (`TauCeti.SmoothEmbedding.NormalSpace`) and its
tubular neighbourhoods (`TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`) for the
closed real locus `M ⊆ X` of RealAnalyticGeometry R3.0, prove the analytic transition comparison for
the same normal bundle, and construct its deformation space: in local normal coordinates the
positive-parameter identification is `(x, y, t) ↦ (x, ty)`, `t > 0`, and the zero fibre is `N_M X`.
Prove chart gluing and transition laws, the positive dilation action, local compactness and the maps
of the open and the zero fibre. With `j` the open positive fibre, `p` its projection to `X` and `s` the
inclusion of the zero fibre, define `ν_M F = s⁻¹Rj_*p⁻¹F` and `μ_M F = (ν_M F)^∧`. Prove independence of
the germ, restriction, naturality in analytic coordinates and bundles, and the comparison of `Rπ_*μ_M F`
with §0.1's complex of sections supported in `M`, where `π` is the projection of the normal cotangent
bundle, constructed from the support localization triangle, specialization and Fourier–Sato inversion.

For `F = O_X` prove **microlocal purity**: `𝓗^q(μ_M O_X) = 0` for `q ≠ n` off the zero section.
Construct the sheaf of microfunctions `C_M = 𝓗ⁿ(μ_M O_X) ⊗ π⁻¹or_(M/X)` there; with coefficients,
`C(E) = 𝓗ⁿ(μ_M O(E^hol)) ⊗ π⁻¹or_(M/X)`, and `Ω_X^p` for hyperforms. Construct the action of `π⁻¹A_M` by
multiplication by holomorphic germs, prove germ independence and, in local frames,
`C(E) ≃ C_M ⊗_(π⁻¹A_M) π⁻¹E`, with transition, restriction and coefficient-map coherence. Construct the
spectral morphism `sp : B_M → π_*C_M` and its coefficient versions; its restriction to an open is that
open's spectral map. Identify its kernel with the image of the injective analytic section map
`A_M → B_M`, and prove the same for bundle sections.

**The cotangent sign.** With Convention 8's identification `ξ(v) = −η(Jv)` and the transform's
inequality `η(y) ≤ 0`, prove that a boundary value from the imaginary cone `Γ` has analytic wavefront in
`Γ° = {ξ : ξ(y) ≥ 0 for all y ∈ Γ}`. Verify this on the upper and lower one-dimensional Cauchy boundary
values and on §3.6's residue-normalized `δ`. Prove independence of the complexification and of analytic
coordinates, and transport the orientation line through the identification with §0.3's signs.
*Needs:* §§0.1, 0.3, 1.1, 1.2, 3a.1, 3a.2; RealAnalyticGeometry R3.0; Tau Ceti's normal bundle and
tubular neighbourhoods.

**Checks.**
- `bv₊(1/z) = 1/(x + i0)` has Fourier transform `−2πi` on `ξ > 0` and `0` on `ξ < 0` with the phase
  `exp(−ixξ)`, so its wavefront at `0` is `{ξ > 0} = Γ° ∖ 0` for `Γ = (0, ∞)`; the lower boundary value
  has wavefront `{ξ < 0}`, and `δ` has both directions. The opposite sign convention for `ξ` would put
  `bv₊(1/z)` in `{ξ < 0}`.

### 3a.4 Conic wedge representatives and the edge of the wedge

The analytic proofs use conic wedge representatives. For normal-coordinate balls build the relative
Dolbeault and Čech complexes on small imaginary tubes and finite families of open convex cones, their
refinement maps, and the deformation comparison with the specialization and transform complexes of
§3a.3. Prove cofinality of these local systems and compatibility with the signed boundary-value map
of §3.5. Prove their exactness away from degree `n` by ComplexKahlerGeometry §2.3's parameter Cauchy
operators, separation of convex cones and shrinking inside strict angular margins, keeping the contour
and Stokes boundary terms in the cochain homotopies.

**Conic flabbiness.** For conic opens `A ⊆ B` of the punctured normal cotangent bundle, every section of
`C_M` over `A` extends to `B`. Compute restrictions through the relative complexes above; choose locally
finite cone refinements with strict angular margins, extend the representative cochains and cancel the
new boundary cocycles with their lower-degree primitives; prove compatibility of these corrections on
nested refinements and glue. Deduce the finite conic splitting lemma with support in prescribed larger
conic neighbourhoods, the support-controlled input to the decomposition below.

**The edge-of-the-wedge relation theorem.** Equality of finite sums of wedge boundary classes in degree
`n` holds exactly when, after shrinking and conic refinement, the difference is a coboundary in these
relative Čech/Dolbeault complexes. Construct the cochain refinements and homotopies and prove their
compatibility with further refinement. No growth bound at the edge is imposed; all contour operations
take place strictly inside the wedges before passing to the boundary class.

**Local conic decomposition with margins.** Given `b` near `x` and finitely many open conic sets `D_j` in
the punctured cotangent fibres covering `supp(sp b)` near `x`, after shrinking write `b` as an analytic
section plus a finite sum `Σ_j bv_(Γ_j)(f_j)` with each closed polar `Γ_j° ∖ 0` inside one prescribed
`D_j`; the cones may be subdivided further into proper convex cones with compact angular margins inside
the `D_j`. Construct the decomposition from the complexes above and prove the relation statement for
two such decompositions; independence is proved by cochains, not by choosing a splitting of vector
spaces.
*Needs:* §§3.5, 3a.3; ComplexKahlerGeometry §2.3.

### 3a.5 The analytic wavefront set

Define `WF_A(b) = supp(sp b) ⊆ T*M ∖ 0`. Prove that it is closed and conic and local, and that its
projection to `M` is the complement of the largest open set on which `b` is an analytic section, which
lies in the support of `b`. Prove the analytic kernel criterion, the inclusions for sums and for
analytic differential operators, and the transformation law under analytic diffeomorphisms of the
cotangent bundle. Extend to finite-rank coefficients by local frames and prove frame independence. For
external products prove
`WF_A(b ⊠ c) ⊆ ((WF_A b ∪ zero_(supp b)) × (WF_A c ∪ zero_(supp c))) ∖ zero`, with the bundle and density
identifications.
*Needs:* §§3.1, 3.3, 3a.3, 3a.4.

### 3a.6 Noncharacteristic pullback

For an analytic map `f : N → M` put `N_f = {(f(x), ξ) : ξ ≠ 0, (df_x)*ξ = 0}`. If `WF_A(b) ∩ N_f = ∅`,
construct `f*b`: locally choose §3a.4's conic decomposition so that every polar cone has a strict
separation margin from `N_f`; prove the linear cone-separation lemma choosing source imaginary cones
whose images under `df` lie strictly inside the target wedges; complexify `f` in charts with
RealAnalyticGeometry R0's holomorphic extension and shrink the radii so its nonlinear remainder keeps
the margins; compose the holomorphic representatives with this extension and apply the source boundary
maps. Prove that analytic terms, relations and refinement coboundaries are preserved, using §3a.4's
edge-of-the-wedge homotopies, and glue. This constructs the map on the Sato sheaves, independently of
the decompositions, cones, radii and complexifications.

Prove complex linearity, compatibility with analytic scalar multiplication, agreement with analytic
sections and with §3.4's submersion pullback and the external product, restriction, and bundle and
density transport. Prove `WF_A(f*b) ⊆ {(x, (df_x)*ξ) : (f(x), ξ) ∈ WF_A(b)} ∖ zero`. Prove identity and
composition whenever `f`, `g` and `f ∘ g` satisfy the noncharacteristic conditions, and compare with
restriction to analytic submanifolds. For analytic bundle-valued maps use the pulled-back coefficients.
*Needs:* §§3.4, 3a.4, 3a.5; RealAnalyticGeometry R0.

### 3a.7 Products

If `WF_A(b) ∩ (−WF_A(c)) = ∅`, define the scalar product `bc` as the diagonal pullback of `b ⊠ c`. Prove
restriction, bilinearity, the unit, agreement with products of analytic functions and commutativity,
and `WF_A(bc) ⊆ (WF_A b ∪ WF_A c ∪ {(x, ξ + η) : (x, ξ) ∈ WF_A b, (x, η) ∈ WF_A c}) ∖ zero`; the first two
terms account for one zero covector at a time. Prove associativity and Leibniz on the common domain
where the successive products and the joint diagonal pullback are noncharacteristic, stating these
conditions in each theorem. Construct bundle contractions and graded hyperform products with their
Koszul signs on the same domains. Conjugation sends `(x, ξ)` to `(x, −ξ)` and obeys the corresponding
product and pullback laws. Treat `n = 0`, the empty manifold and rank `0` directly, and use the
componentwise carriers for arbitrary dimensions and ranks.
*Needs:* §§3.3, 3a.5, 3a.6.

**Checks.**
- `bv₊(1/z)²` is defined, since `WF_A(bv₊(1/z)) = {ξ > 0}` at `0` meets `−{ξ > 0}` nowhere, and equals
  `bv₊(1/z²)`; `bv₊(1/z) · bv₋(1/z)` is not covered, since their wavefronts at `0` are opposite.

### Examples

At `0 ∈ ℝ`, `WF_A(δ) = {ξ ≠ 0}`, `WF_A(bv₊(1/z)) = {ξ > 0}` and `WF_A(bv₋(1/z)) = {ξ < 0}`; the restriction
of a hyperfunction on `ℝ²` to the line `{x₂ = 0}` is defined where its wavefront avoids the conormal
directions `(0, ±1)`.

### Dependencies

Layers 0–3; RealAnalyticGeometry R0 and R3.0; ComplexKahlerGeometry §2.3; ComplexComparisonPartII
§C6.1; Tau Ceti's extension by zero, closed direct image, normal bundle and tubular neighbourhoods;
Mathlib's derived categories and sheaf direct and inverse images.

## Layer 4: canonical distribution and density embedding

Honda–Izawa–Suwa fixes the embedding conventions.

### 4.1 The embedding and its properties

Construct the canonical injective complex-linear sheaf morphism `ι : Db_M → B_M` from distributions to
hyperfunctions, and its versions for densities and for bundle coefficients. Distributions are
ComplexKahlerGeometry §5.1's density-tested continuous dual, with its comparison with Mathlib's
Euclidean real-test `Distribution`; tests are complexified by `T(φ + iψ) = Tφ + iTψ`, and pairings are
bilinear. Prove agreement on analytic functions (`ι` of the distribution of an analytic function is its
analytic section), compatibility with restriction, equality of supports, compatibility with analytic
differential operators and naturality under analytic submersions. In particular `d(ιu) = ι(du)` with
§3.2's right-form convention, and `ι` commutes with conjugation. Scalar pullback uses the density
transpose and the absolute value of the Jacobian; hyperdensities carry the corresponding density
factor. Sections 4.2–4.4 construct `ι`.
*Needs:* §§3.1–3.4, 4.2–4.4; ComplexKahlerGeometry §5.1; PseudodifferentialOperators §P1.0
(differential operators and their density transpose).

### 4.2 Dimension one: the Cauchy characterization

For a compactly supported complex-valued distribution `u` on `ℝ` and a real compactly supported
smooth `χ` equal to `1` on a neighbourhood of `supp u`, the Cauchy transform is
`C_u(z) = (2πi)⁻¹ ⟨u_t, χ(t)/(t − z)⟩` for `Im z ≠ 0`, with `u` extended complex-linearly to complex
tests. Tau Ceti proves that `C_u` is holomorphic off `ℝ`, independent of `χ`, complex-linear in `u`,
and that `C_δ(z) = −1/(2πiz)`. Prove the jump formula `bv₊C_u − bv₋C_u = u` as distributions
(`tendsto_integral_cauchyTransform_sub`: the pairing of a test function with
`C_u(x + iγ) − C_u(x − iγ)` tends to the pairing with `u` as `γ → 0⁺`).

A family of complex-linear maps `ι_U : Db(U) → O(ℂ ∖ ℝ)/O(W(U))` is a Cauchy embedding
(`IsCauchyEmbedding`) if it commutes with restriction of distributions (`restrictDistribution`,
precomposition with Mathlib's `TestFunction.monoCLM`) and sends every compactly supported `u` on `ℝ` to
the class of `C_u`. Prove that there is exactly one (`existsUnique_isCauchyEmbedding`) and that it is
injective (`IsCauchyEmbedding.injective`). Uniqueness: multiply a local distribution by a compactly
supported smooth cutoff, extend the compactly supported distribution by zero, and compare on a smaller
open set where the cutoff is `1`; restriction and the separatedness of the quotient presheaf give
equality of any two such families. Existence glues the classes of the local Cauchy transforms with the
sheaf property of §1.3. The cutoffs act on distributions; the hyperfunction scalar action stays
analytic.
*Needs:* §§1.3, 3.6; Tau Ceti `Distribution.cauchyTransform` and its theorems,
`TauCeti.Hyperfunction.oneDimBoundaryPresheaf_isSeparated`; Mathlib `TestFunction.monoCLM`;
ComplexKahlerGeometry §5.2 (interval cutoffs and extension by zero of compactly supported
distributions).

**Checks.**
- For `u = δ` and `χ(0) = 1`, `C_δ(x + iγ) − C_δ(x − iγ) = γ/(π(x² + γ²))`, the Poisson kernel, whose
  integral is `1` and which tends to `δ`. The normalization `−(2πi)⁻¹` in place of `(2πi)⁻¹` gives `−δ`.
- For `u` the indicator function of `[0, 1]`,
  `C_u(x + iγ) − C_u(x − iγ) = (2πi)⁻¹ ∫₀¹ 2iγ/((t − x)² + γ²) dt = π⁻¹(arctan((1 − x)/γ) + arctan(x/γ))`,
  which tends to `1` for `0 < x < 1`, to `1/2` at `x = 0` and `x = 1`, and to `0` off `[0, 1]`.

### 4.3 The model construction in ℝⁿ

In the model `U ⊆ ℝⁿ` fix `W = ℂⁿ ∖ (ℝⁿ ∖ U)`, so `W ∩ ℝⁿ = U`. Choose `θ(z, t)` smooth on `ℂⁿ × U`, equal
to `1` near `{0} × U`, with closed support in `ℂⁿ × U` contained in an open tube `T` with
`{0} × U ⊆ T ⊆ {(z, t) : ‖z‖ < min(1, dist(t, ℝⁿ ∖ U))/3}`, the distance to the empty set being
infinite. For a relative delta-density representative `(τ₁, τ₀₁)` use
`(θτ₁ + ∂̄_zθ ∧ τ₀₁, θτ₀₁)`, substitute `z − t`, and pair with the distribution in `t`
(Honda–Izawa–Suwa, Theorem 8.1, p. 46, with the tube condition (8.8), p. 49). Prove a common compact
`t`-support for every compact `L ⊆ W`, smooth dependence on parameters, commutation with `∂̄`,
the cocycle laws, and independence of cutoff, tube and representative. These smooth cutoffs act on
distribution tests and representatives.

Prove cutoff independence by the explicit relative primitive: if `δθ = θ − θ′`, then `δθ` vanishes near
`{0} × U`, `δθ τ₀₁` extends smoothly by zero there, and the difference of the representatives is
`d_rel(δθ τ₀₁, 0)`, followed by the same pairing. For a change by a relative coboundary prove directly
that the cutoff operator `R_θ(σ₁, σ₀₁) = (θσ₁ + ∂̄θ ∧ σ₀₁, θσ₀₁)` commutes with `d_rel`. For restriction,
refine the tube near a retained real open so that its tests miss the discarded source support, and
apply cutoff independence. Common compact `t`-stages and finite-order `C^k` bounds justify every
`z`-derivative and the relative primitives. Coordinate independence uses §2.3's coordinate and density
naturality of ManifoldBundleCompactDuality and this localization; these are the consuming steps for
smooth parameter dependence of the kernel pairing.
*Needs:* §§0.2, 2.3, 3.5.

**Checks.**
- `R_θ` commutes with `d_rel`: `d_rel R_θ(σ₁, σ₀₁) = (∂̄(θσ₁ + ∂̄θ ∧ σ₀₁), θσ₁ + ∂̄θ ∧ σ₀₁ − ∂̄(θσ₀₁))`
  and `∂̄(θσ₀₁) = ∂̄θ ∧ σ₀₁ + θ∂̄σ₀₁`, so the second entry is `θ(σ₁ − ∂̄σ₀₁)`, which is the second entry of
  `R_θ d_rel(σ₁, σ₀₁)`; the first entries agree by `∂̄² = 0`. Without the term `∂̄θ ∧ σ₀₁` the second
  entries differ by `∂̄θ ∧ σ₀₁`.

### 4.4 The Bochner–Martinelli delta and injectivity

For `n > 0` keep the exact Bochner–Martinelli normalization

```
β_n^0 = (−1)^(n(n−1)/2) (n−1)! / (2πi)^n
        · Σ_j (−1)^(j−1) z̄_j dz̄₁ ∧ … ∧ (omit dz̄_j) ∧ … ∧ dz̄_n / ‖z‖^(2n),
δ₀    = [(0, −(−1)^(n(n+1)/2) β_n^0)] ⊗ or_y.
```

This is Honda–Izawa–Suwa, Definition 6.13, p. 24, and Theorem 6.14 there evaluates it on germs of
analytic densities.
The density kernel wedges `β` with `dz₁ ∧ ⋯ ∧ dz_n` and uses the ambient orientation line; identify
`or_X ⊗ or_M^(−1) ≃ or_(M/X)` by the normal-first convention. Prove evaluation on germs of analytic
densities, all derivatives of `δ`, and `δ = (bv₋(1/z) − bv₊(1/z))/(2πi)` in dimension one. Use §2.3's
coordinate and density naturality for coordinate independence, and prove injectivity of `ι` by analytic
Gaussian approximation (Honda–Izawa–Suwa, Proposition 8.22, p. 53) in every derivative seminorm
required by the local order of the distribution, with exponential bounds on separated supports. Glue
through analytic charts and all bundle and orientation transitions.
*Needs:* §§0.3, 2.3, 3.6, 4.3.

**Checks.**
- `n = 1`: `β_1^0 = z̄/(2πi|z|²) = 1/(2πiz)`, the factor `−(−1)^(n(n+1)/2)` is `1`, and
  `δ₀ = [(0, 1/(2πiz))] ⊗ or_y`, §3.6's class. Measured against the interleaved orientation instead of
  the normal-first one, the sign `(−1)^(n(n+1)/2) = −1` would give `−δ`.

### 4.5 ModerateBoundaryComparison

**ModerateBoundaryComparison.** Let `f` be holomorphic on a wedge as in §3.5 and suppose that for each
compact `K ⊆ U` and each closed angular subcone `Γ′` compactly contained in `Γ` there are `C_(K,Γ′)` and
`N_(K,Γ′)` with `|f(x + iy)| ≤ C_(K,Γ′) ‖y‖^(−N_(K,Γ′))` for `x ∈ K` and small `y ∈ Γ′`. Prove that its
distributional boundary limit exists on the LF tests and that its image under `ι` is §3.5's `bv_Γ(f)`.
Give the finite test-seminorm bounds and independence of the direction of approach, deriving derivative
bounds by Cauchy estimates on smaller cones. Prove the same equality for any independently given
distributional boundary limit with the stated test convergence. This is the distribution comparison of
§3.5's boundary values.
*Needs:* §§3.5, 4.1.

### 4.6 The analytic wavefront of distributions

Prove `WF_A(ιu) = WF_A(u)` for distributions, where the right side is the analytic wavefront set of a
distribution, distinct from PseudodifferentialOperators' smooth wavefront set. In a real-analytic chart
define its complement through sequences of compactly supported distributions `u_N`, bounded in one
fixed finite-order compact-support stage and equal to `u` near the point: there are a compact `K`, an
order `m` and `C₀` with `|u_N(φ)| ≤ C₀ max_(|α|≤m) sup_K |∂^αφ|` for every `N` and every smooth test `φ`,
and `|û_N(ξ)| ≤ C^(N+1) (N+1)^N (1 + ‖ξ‖)^(−N)` in an open conic neighbourhood, for every `N ≥ 1`. Prove
independence of the sequence, the coordinates and the densities. Use the Fourier phase of Convention 8
and prove its `ξ = 2πζ` comparison with Mathlib's Fourier convention. Construct the analytic cutoff
sequences, Cauchy bounds and localized Cauchy and Bochner–Martinelli contour estimates that give the
equivalence with Layer 3a's spectral definition. With the embedding and this comparison, analytic
pullback and products of distributions agree with PseudodifferentialOperators' distribution pullback
and products whenever the analytic noncharacteristic conditions hold; the weaker smooth-wavefront
operations keep their own domain.
*Needs:* §§3a.5–3a.7, 4.1, 4.4; PseudodifferentialOperators Conventions and §§9.1–9.2.

### Examples

`ι(δ) = δ`, the class of `−1/(2πiz)`; `ι(PV 1/x) = (bv₊(1/z) + bv₋(1/z))/2`; for the Heaviside function
`H`, `ι(H)` is the class of `−(2πi)⁻¹ log(−z)` with the principal branch, whose jump across `x > 0` is `1`.

### Dependencies

Layers 1–3a; ComplexKahlerGeometry §§5.1–5.2; PseudodifferentialOperators §P1.0 and Layer 9; Tau Ceti's
Cauchy transform and one-dimensional quotient presheaf.

## Layer 5: arbitrary-open extension and examples

### 5.1 Extension across arbitrary opens

For every pair of opens `U ⊆ V` of `M` and every `u ∈ Db(U)`, there is `b ∈ B(V)` with `b|_U = ι_U(u)`;
more generally every section of `B(U)` extends to `V`. For a chosen extension `b₀` the set of all
extensions is `b₀ + ker(B(V) → B(U))`, and this kernel is the space of sections supported in `V ∖ U`.
Prove the exact restriction sequence `0 → Γ_(V∖U)(V, B) → B(V) → B(U) → 0` and this affine description;
its surjectivity is flabbiness (Honda–Izawa–Suwa, Theorem 2.14(2), p. 8; §2.2).
This is an existence statement with the full supported ambiguity; growth, regularity, covariance and
choices of continuous extension operators are different assertions with their own hypotheses.
*Needs:* §§2.2, 4.1.

### 5.2 The factorial-square analytic functional

In dimension `1` put `L(φ) = Σ_(k≥0) φ^(k)(0)/(k!)²` on analytic germs at `0`. With the derivative
pairing `⟨δ^(k), φ⟩ = (−1)^k φ^(k)(0)` this is the series `Σ_(k≥0) (−1)^k δ^(k)/(k!)²`. Cauchy estimates
prove continuity on each complex neighbourhood and compatibility with the germ limit; §2.1 gives its
point-supported hyperfunction. It has `L(x^m) = 1/m!` for every `m`, so ComplexKahlerGeometry §5.2's
finite point-jet theorem makes it a hyperfunction that is not a distribution. The literal series
`Σ_n δ^(n)/n!` defines no distribution (Tau Ceti). On the germ `1/(1 + 2z)` its partial sums are the
partial sums of `Σ 2^n`, so it is not an analytic functional either; the factorial-square series is the
sign-normalized convergent comparison, and on the same germ it gives `Σ_k (−2)^k/k! = e^(−2)`.
*Needs:* §2.1; ComplexKahlerGeometry §5.2; Tau Ceti `TauCeti.not_tendsto_sum_normalized_delta_derivative`.

**Checks.**
- `L(x^m) = m!/(m!)² = 1/m!`, and on `1/(1 + 2z)`, whose derivatives at `0` are `k!(−2)^k`, `L` gives
  `Σ (−2)^k/k! = e^(−2) ≈ 0.1353` while the literal `1/n!` series gives partial sums `1, 3, 7, 15, …`.
- `|φ^(k)(0)| ≤ k! M_r r^(−k)` for `φ` bounded by `M_r` on the disc of radius `r`, so
  `|L(φ)| ≤ M_r e^(1/r)` for every `r > 0`: `L` is continuous on every germ stage. With weights
  `1/k!` in place of `1/(k!)²` the bound `M_r Σ r^(−k)` diverges for `r ≤ 1`.

### 5.3 The exp(1/‖x‖²) extension and comparisons

ComplexKahlerGeometry §5.2 proves that for every real `n ≥ 1` the function `exp(1/‖x‖²)` on
`ℝⁿ ∖ 0`, tested against a nonnegative bump supported in the unit ball, is a distribution with no
extension to `ℝⁿ`. Layers 2 and 4 extend it to a hyperfunction on `ℝⁿ`: in dimension `1` identify the
explicit extension `bv₊(exp(1/z²))`, and in higher dimensions use flabbiness. Compare the smooth function
`exp(x²)` on the whole line, which is not tempered, and `exp(−x²)`. Treat dimension `0` directly. Export
transport to configuration spaces and linear quotient coordinates through §3.4's analytic submersion
pullback.
*Needs:* §§2.2, 3.4, 3.5, 4.1; ComplexKahlerGeometry §5.2.

**Checks.**
- On `ℝ ∖ 0`, `bv₊(exp(1/z²))` restricts to `ι(exp(1/x²))`: `exp(1/z²)` is holomorphic on the upper
  half-plane and holomorphic across `ℝ ∖ 0`, with boundary value `exp(1/x²)` there. At `0` it is not
  moderate: along `z = iy` it is `exp(−1/y²)`, which is bounded, but along `z = e^(iθ)y` with
  `0 < θ < π/4` its modulus is `exp(cos(2θ)/y²)`, so no bound `C y^(−N)` holds and §4.5 does not apply.

### Examples

The extension of `ι(1/x)` on `ℝ ∖ 0` to `ℝ` is not unique: `ι(PV 1/x)` and `ι(PV 1/x) + cδ` are both
extensions, and every extension is of this form plus a hyperfunction supported at `0`, which by §2.1 is
an analytic functional at `0`.

### Dependencies

Layers 2–4; ComplexKahlerGeometry §5.2; Tau Ceti's delta-series theorem.

## Downstream consumers

- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) leaves to §5.2 the point-supported
  analytic-functional reading and the factorial-square comparison of its delta-series example.
- [GlobalHolomorphicFunctions](../GlobalHolomorphicFunctions/README.md) identifies its §7.1 with the
  case `n = 1` of MalgrangeTopVanishing (§2.0a).

Other roadmaps cite this one in its former numbering, which maps to the sections above as follows.

| Former numbering | Section |
| --- | --- |
| HF0 | Layer 0 |
| HF1 | Layer 1 |
| HF2 | Layer 2 |
| HF2.AnalyticPreparation (MalgrangeTopVanishing) | §2.0a |
| HF2.AnalyticPreparation.FunctionalDuality | §2.0b (the Fréchet–Schwartz property) and §2.0e |
| HF2.AnalyticPreparation.CurrentResolution | §2.0c, with CurrentTopologyBridge in §2.0d |
| HF2.AnalyticPreparation.SteinBundleDuality | §2.0f |
| HF2.1 | §2.1 |
| HF2.1a | §2.1a |
| HF2.1b | §2.1b |
| HF2.1c | §2.1c |
| HF2.2 | §2.2 |
| HF2.3 | §2.3 |
| HF3 | Layer 3 |
| HF3a | Layer 3a |
| HF4 | Layer 4 |
| HF5 | Layer 5 |

## Scope and ownership

**This roadmap owns** the derived-functor, coefficient and edge comparisons for complex coefficients
of §0.1, the relative Dolbeault complex (§0.2), the relative orientation sheaf and its zero-section
instance, the orientation sheaf of a manifold, as a sheaf on opens (§0.3; ImplicitAtlases §0.10
defines the orientation sheaf of a topological manifold through local homology on compact sets, and
Tau Ceti the orientation local system of a vector bundle on the fundamental groupoid of its base);
the Sato sheaves, hyperforms, bundle-valued hyperfunctions and hyperdensities on real-analytic
manifolds and the gluing theorem in dimension one (Layer 1); MalgrangeTopVanishing in every
dimension `n ≥ 1` (§2.0a), the harmonic Runge theorem, the Newton potential of a compactly supported
distribution and the exterior multipole expansion; the Fréchet–Schwartz property of smooth sections,
compact currents, Dolbeault regularization, the finite-colour chart refinement, the current topology
bridge, the FS/DFS duality theory and the compact Banach-limit theorem, and Stein bundle duality
(§§2.0b–2.0f); compact analytic duality, compact tautness, the germ topology, real-support purity,
flabbiness and Martineau duality (§§2.1–2.3); the analytic operations and boundary values (Layer 3);
conic sheaves, the projection formula, the proper-support Fubini comparison and the Euclidean
dimension bounds of §3a.1, the Fourier–Sato transform as far as Layer 3a uses it, specialization,
microfunctions, the analytic wavefront set and analytic noncharacteristic pullback and products
(Layer 3a); the distribution embedding and its comparisons (Layer 4); arbitrary-open extension and
the examples of Layer 5.

**Already in the library and consumed here.** Each object has one owner; the exact declarations are
listed under the supplier contracts.

- *Supported and local cohomology*: Tau Ceti owns cohomology with supports in a closed set for abelian
  and module coefficients, with excision, the support and coefficient sequences, flasque vanishing, the
  local cohomology sheaves, and, for abelian coefficients, support truncation and the degenerate edge
  comparison in every degree; §0.1 compares and transports them.
- *Large-universe sheaves of modules*: Tau Ceti's sheafification, Grothendieck-abelian and
  enough-injectives instances for module sheaves whose section universe exceeds that of the scalars.
- *Flasque locality* (**FlasqueLocality**): Tau Ceti proves that a sheaf whose restrictions are
  surjective inside some neighbourhood of each point is flasque, for sheaves of sets and of modules,
  and the flasqueness of finite products and of sheaves locally isomorphic to finite powers.
- *Relative coordinates on the shifted cone*: Tau Ceti's `CochainComplex.mappingCocone.relativeCoordinates`
  fixes the relative convention of Convention 4.
- *Dimension one*: Tau Ceti's quotient presheaf `U ↦ O(ℂ ∖ ℝ)/O(W(U))` with surjective restrictions and
  separatedness, and the Cauchy transform with holomorphy, cutoff independence, linearity and the value
  on `δ`; §§1.3 and 4.2 prove gluing, the jump formula and the embedding.
- *Euclidean analysis*: Tau Ceti's filled compact exhaustions of open sets, real analyticity of harmonic
  functions, the Newtonian kernels as fundamental solutions and the weak Poisson problem on open sets
  inside a ball; Schauder's theorem.
- *Polynomial convexity*: Tau Ceti's polynomial hulls, polynomial convexity of compact real sets,
  polynomial polyhedron neighbourhoods and their strictly plurisubharmonic exhaustion; §2.1a proves the
  Stein conclusion.
- *Sheaf functors*: Mathlib's direct and inverse image and extension by zero (`Functor.sheafPullback`
  along an open inclusion), with Tau Ceti's exactness of extension by zero and of closed direct image
  and Mathlib's exactness of inverse image; §3a.1 consumes them.
- *Normal bundles and tubular neighbourhoods*: Tau Ceti; §3a.3 adds the analytic comparison.
- *The literal delta series*: Tau Ceti proves that `Σ δ^(n)/n!` converges to no distribution.

**Owned by other roadmaps and consumed here.**

- [RealAnalyticGeometry](../RealAnalyticGeometry/README.md): R0 (holomorphic extension of real-analytic
  functions), R3.0 (complexification, real structure, germ uniqueness, Grauert's strictly psh function),
  R3.1 (weighted Stein theory, the strictly psh exhaustion criterion, Oka–Weil, finite generation of
  bundles) and R3.2 (coherent Cartan A and B).
- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md): the form carrier and type calculus
  (§§1.1, 1.3), the parameter-dependent one-variable solver and polydisc Dolbeault lemma (§§2.3–2.4),
  the sheaves `Ω^p`, the Dolbeault theorem and the Čech/derived comparison (§2.5), the realified atlas
  (§3.1), holomorphic bundles (§4.1), distributions, bundle tests and densities (§5.1), their local
  structure, point jets, interval cutoffs and the `exp(1/‖x‖²)` example (§5.2), and the smooth-section
  Fréchet topology with its compact-distribution dual (§5.3). Its compact Serre duality (§5.10) is a
  different theorem from §2.0f.
- [GlobalHolomorphicFunctions](../GlobalHolomorphicFunctions/README.md): the compact-support
  Cauchy–Green formula (§0.3), the global `∂̄` solver on open subsets of `ℂ` (§7.1), which is
  MalgrangeTopVanishing for `n = 1`, and Cousin I (§7.4).
- [ComplexComparisonPartII](../ComplexComparisonPartII/README.md): §C6.1's compact-support theory for
  sheaves of modules over a commutative ring on locally compact Hausdorff spaces (the stalk and section
  formulas of extension by zero, c-soft resolutions, derived compact-support sections, the localization
  triangle and `Rf_!`), used in §3a.1 with coefficients `ℂ`.
- [PseudodifferentialOperators](../PseudodifferentialOperators/README.md): differential operators and
  their density transpose (§P1.0), interior elliptic regularity (§6.2), the Fourier convention, and the
  smooth wavefront set with distribution pullback and products (§§9.1–9.2).
- [BanachSpaceTheory](../BanachSpaceTheory/README.md): the Banach adjoint, bidual naturality and norming
  (B1), Gantmacher's criterion and compact-implies-weakly-compact (B2).

The physical quotient and Haar normalizations and the graph adapters of quantum field theory, which use
the operations of Layers 3–5, are not targets here.

## Exact supplier contracts

### From Mathlib

- Sheaves and flasqueness: `TopCat.Sheaf`, `TopCat.Presheaf.IsFlasque` (every restriction map is an
  epimorphism) and `TopCat.Sheaf.IsFlasque`; `ModuleCat`, `AddCommGrpCat`; the stalk exactness and
  zero-detection theorems of `Mathlib/Topology/Sheaves/Abelian.lean`.
- Sheaf functors: `TopCat.Sheaf.pushforward`, `TopCat.Sheaf.pullback`, `Functor.sheafPullback` (the
  left adjoint of sheaf pushforward along a continuous functor of sites; along `Over.forget U` for an
  open `U` it is extension by zero) and `Functor.sheafPullbackConstruction.preservesFiniteLimits` (it
  is left exact along a representably flat functor).
- Homological algebra: `CochainComplex.mappingCone` (differential `(a, b) ↦ (−d a, f a + d b)`),
  `CochainComplex.mappingCocone`, `CochainComplex.shiftFunctor_obj_d'` (the shift by `k` multiplies the
  differential by `(−1)^k`), `CategoryTheory.IsGrothendieckAbelian.enoughInjectives`,
  `HasDerivedCategory.standard`, `DerivedCategory.Plus`, `Functor.rightDerivedFunctorPlus`.
- Functional analysis: `StrongDual` (`E →L[𝕜] 𝕜` with the bounded-convergence topology),
  `ContinuousLinearMap.precomp`, `ContinuousLinearMap.instCompleteSpace` (completeness of the strong
  dual of a sequential topological vector space), `ContinuousLinearEquiv.arrowCongr`,
  `BaireSpace.instBarrelledSpace`, `WithSeminorms.banach_steinhaus`.
- Manifolds: `FiniteDimensional.complexToReal`, `finrank_real_of_complex`,
  `ModelWithCorners.locallyCompactSpace`, `ChartedSpace.locallyCompactSpace`,
  `ModelWithCorners.isClosed_range`, `exists_contMDiffMap_zero_one_of_isClosed`.
- Distributions: `TestFunction`, `Distribution` (continuous `ℝ`-linear maps on real test functions with
  the topology of compact convergence), `TestFunction.monoCLM` (the inclusion of test functions on a
  smaller open set, zero when the sets are not nested), `ContinuousLinearMap.precompCompactConvergenceCLM`,
  `TestFunction.continuous_iff_continuous_comp` (the universal property of the inductive limit),
  `Distribution.delta`, `Distribution.mapCLM`, `Distribution.dsupport`.
- Analytic functions: `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (the identity principle).

### From Tau Ceti

Paths are under `TauCeti/`.

- *Supported cohomology, abelian coefficients* (`Topology/Sheaves/SupportedCohomology.lean`), in
  `CategoryTheory.Sheaf`: `supportedSections`, `supportedH` (`Ext` out of the relative free sheaf),
  `supportedHZeroEquiv`, `supportedHRestrict`, `supportedHPresheaf`, `supportedHExcisionEquiv`,
  `supportedHMap`, `supportedHδ` with `exact_supportedHMap_supportedHRestrict`,
  `exact_supportedHRestrict_supportedHδ` and `exact_supportedHδ_supportedHMap` (the sequence of supports
  `Z ⊆ S`), `supportedHPresheafδ` (the coefficient sequence), and `relativeH'.subsingleton_succ_of_isFlasque`
  (flasque vanishing); `CategoryTheory.Sheaf.relativeH'` with the long exact sequences of a pair and a
  triple (`CategoryTheory/Sites/SheafCohomology/Relative.lean`) and `CategoryTheory.Sheaf.H'AddEquivExt`
  (`CategoryTheory/Sites/SheafCohomology/FreeYoneda.lean`).
- *Local cohomology sheaves, abelian coefficients* (`Topology/Sheaves/LocalCohomology/Basic.lean`), in
  `CategoryTheory.Sheaf`: `supportedSectionsSheaf`, `supportedSectionsFunctor` and
  `exact_map_supportedSectionsFunctor`, `supportedHSheaf`, `supportedHSheafZeroIso`,
  `isZero_stalk_supportedHSheaf_of_notMem`, `isZero_supportedHSheaf_succ_of_isFlasque`,
  `subsingleton_supportedH_of_isZero_supportedHSheaf` (support truncation), `supportedHSectionsEquiv`,
  `supportedHEdgeEquiv`, `supportedHPresheafEdgeIso` (if `𝓗^q_S(F) = 0` for all `q ≠ n`, then
  `H^(n+j)_Z(−, F) ≅ H^j_Z(−, 𝓗ⁿ_S(F))` for closed `Z ≤ S`) and `bijective_postcomp_mk₀_supportedSectionsι`.
- *Module coefficients* (`Topology/Sheaves/SupportedCohomology/Module.lean`, `…/Sections.lean`,
  `Topology/Sheaves/LocalCohomology/Module.lean`, `Topology/Sheaves/Flasque/Module.lean`), for a
  commutative ring `R : Type u` and `X : TopCat.{u}`: `TopologicalSpace.Closeds.supportedFreeModuleSheafFunctor`
  (the sheaf `Q_S(W)`), `TopologicalSpace.Closeds.supportedFreeModuleSheafHomEquiv`
  (`Hom(Q_S(W), F) ≃ Γ_S(W, F)`), `CategoryTheory.Sheaf.supportedSubmodule`, `supportedModuleH`,
  `supportedModuleHPresheaf`, `supportedModuleHZeroEquiv`, `supportedModuleHExcisionEquiv`,
  `supportedModuleHδ` with its exactness theorems, `subsingleton_supportedModuleH_succ_of_isFlasque`,
  `supportedSubmoduleSheaf`, `supportedSubmoduleFunctor`, `exact_map_supportedSubmoduleFunctor`,
  `supportedSubmoduleSheafForgetIso`, `supportedSubmoduleFunctorForgetIso`, `supportedModuleHSheaf`,
  `supportedModuleHSheafZeroIso`, `isZero_stalk_supportedModuleHSheaf_of_notMem`.
- *Universes* (`Algebra/Category/ModuleCat/Sheaf/Universe.lean`): `TauCeti.hasSheafify_moduleCat`,
  `TauCeti.isGrothendieckAbelian_sheaf_moduleCat`, `TauCeti.enoughInjectives_sheaf_moduleCat`,
  `TauCeti.enoughInjectives_topCatSheaf_moduleCat`.
- *Flasque locality* (`Topology/Sheaves/Flasque/Locality.lean`, `…/Products.lean`):
  `TopCat.Presheaf.IsSheaf.map_surjective_of_locally_flasque`, `TopCat.Sheaf.map_surjective_of_locally_flasque`,
  `TopCat.Sheaf.isFlasque_of_locally_flasque`, `TopCat.Sheaf.isFlasque_piObj`,
  `TopCat.Sheaf.isFlasque_of_locally_iso_pi`.
- *Relative coordinates* (`Algebra/Homology/HomotopyCategory/MappingCocone/Relative.lean`):
  `CochainComplex.mappingCocone.relativeCoordinates`, the degreewise equivalence of
  `mappingCocone f` with `K.X p × L.X (p − 1)` under which the differential is `(a, b) ↦ (d a, f a − d b)`.
- *Holomorphic functions* (`Geometry/Manifold/Complex/StructureSheaf/Basic.lean`):
  `TauCeti.holomorphicStructureSheaf` and `TauCeti.holomorphicStructureSheafModules`, the sheaf of
  complex-analytic functions on a complex manifold as a sheaf of rings and of complex vector spaces.
- *Dimension one* (`Analysis/Hyperfunction/OneDimensional.lean`), in `TauCeti.Hyperfunction`:
  `holomorphicSections`, `holomorphicRestrict`, `nonRealOpen`, `complexNeighborhood`, `throughReal`,
  `throughReal_iSup`, `OneDimBoundaryQuotient`, `oneDimBoundaryRestrict`,
  `oneDimBoundaryRestrict_surjective`, `eq_of_oneDimBoundaryRestrict_eq`, `oneDimBoundaryPresheaf`,
  `oneDimBoundaryPresheaf_isSeparated`.
- *The Cauchy transform* (`Analysis/Hyperfunction/CauchyTransform.lean`,
  `Analysis/Distribution/ComplexPairing.lean`): `TestFunction.cauchyKernel`, `Distribution.cauchyTransform`
  (`(2πi)⁻¹ ⟨u_t, χ(t)/(t − z)⟩` off `ℝ`, zero on `ℝ`), `Distribution.hasDerivAt_cauchyTransform`,
  `Distribution.cauchyTransform_mem_holomorphicSections`, `Distribution.cauchyTransform_congr`,
  `Distribution.cauchyTransform_add`, `Distribution.cauchyTransform_smul`, `Distribution.cauchyTransform_delta`,
  `Distribution.cauchyTransform_delta_zero`; `Distribution.complexPairing` and
  `Distribution.exists_norm_complexPairing_le`.
- *Euclidean analysis*: `IsOpen.exists_isFilledIn_compact_exhaustion` and `TauCeti.IsFilledIn`
  (`Analysis/Normed/Module/Exhaustion.lean`); `InnerProductSpace.HarmonicAt.analyticAt` and
  `InnerProductSpace.HarmonicOnNhd.analyticOnNhd` (`Analysis/InnerProductSpace/Harmonic/Analytic.lean`);
  `TauCeti.newtonianKernel` with `TauCeti.integral_laplacian_mul_newtonianKernel_sub` and
  `TauCeti.laplacian_newtonianKernel_convolution` (`d ≥ 3`), and `TauCeti.planarNewtonianKernel` with
  `TauCeti.integral_laplacian_mul_planarNewtonianKernel_sub`, fundamental solutions of `−Δ`
  (`Analysis/PDE/FundamentalSolution/`); `ContinuousLinearMap.isCompactOperator_precomp_iff`
  (Schauder's theorem, `Analysis/Normed/Operator/Compact/Adjoint.lean`).
- *Polynomial convexity* (`Analysis/Complex/PolynomialHull/Basic.lean`, `…/Exhaustion.lean`), on `ι → ℂ`
  with the sup norm: `TauCeti.polynomialHull`, `TauCeti.IsPolynomiallyConvex`,
  `IsCompact.isPolynomiallyConvex_of_forall_im_eq_zero`, `TauCeti.polynomialPolyhedron`,
  `TauCeti.isPolynomiallyConvex_polynomialPolyhedron`, `TauCeti.interior_polynomialPolyhedron`,
  `TauCeti.IsPolynomiallyConvex.exists_subset_interior_polynomialPolyhedron`,
  `TauCeti.IsPolynomiallyConvex.exists_polynomialPolyhedron_subset_of_nonempty`,
  `TauCeti.polynomialPolyhedronExhaustion`, `TauCeti.contDiffOn_polynomialPolyhedronExhaustion`,
  `TauCeti.isStrictlyPlurisubharmonicAt_polynomialPolyhedronExhaustion`,
  `TauCeti.isCompact_inter_setOf_polynomialPolyhedronExhaustion_le`.
- *Sheaf functors* (`CategoryTheory/Sites/ExtensionByZero.lean`,
  `Algebra/Category/ModuleCat/Sheaf/ExtensionByZero.lean`, `Topology/Sheaves/ClosedEmbedding.lean`):
  `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback` (extension by zero
  from a lower interval of a preorder site, `Functor.sheafPullback` along `Over.forget U`, is exact for
  abelian sheaves), `SheafOfModules.preservesFiniteLimits_pullback_over` (the same for sheaves of
  modules) and `TauCeti.Topology.preservesFiniteColimits_pushforward_of_isClosedEmbedding` (direct
  image of abelian sheaves along a closed embedding is exact).
- *The weak Poisson problem* (`Analysis/PDE/DirichletProblem.lean`):
  `TauCeti.PDE.existsUnique_isWeakSolutionDirichlet_laplacian_of_subset_ball` (for an open `O` inside
  a ball of `ℝ^(m+1)` and `g ∈ L²(O)`, a unique `u ∈ H¹₀(O)` with `∫ ∇v·∇u = ∫ g v` for every
  `v ∈ H¹₀(O)`).
- *Normal bundles* (`Geometry/Manifold/TubularNeighborhood/`): `TauCeti.SmoothEmbedding.NormalSpace` and
  `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`.
- *The delta series* (`Analysis/Distribution/DeltaSeries.lean`): `TauCeti.not_tendsto_sum_normalized_delta_derivative`.

### From TauCetiRoadmap.RealAnalyticGeometry

R0 (holomorphic extension of a real-analytic function on an open subset of `ℝ^m` to a
conjugation-invariant complex neighbourhood); R3.0 (the Bruhat–Whitney complexification of every
Hausdorff, second-countable real-analytic manifold, its antiholomorphic involution with fixed locus `M`,
uniqueness of its germ, and Grauert's strictly psh function); R3.1 (the strictly psh exhaustion
criterion for Stein manifolds, Oka–Weil approximation on holomorphically convex compacts, Stein
neighbourhoods of `O(X)`-convex compacts, finite generation of holomorphic bundles near a compact); R3.2
(Cartan A and B for coherent sheaves on Stein manifolds).

### From TauCetiRoadmap.ComplexKahlerGeometry

§§1.1, 1.3 (forms and type calculus), §2.3 (the parameter-dependent one-variable `∂̄` solver on
`P × Q × Ω` for any open `Ω ⊆ ℂ`), §2.4 (the Dolbeault–Grothendieck lemma on polydiscs), §2.5 (the sheaves
`Ω^p`, their fine Dolbeault resolutions, the Dolbeault theorem and the Čech/derived comparison), §3.1
(the realified analytic atlas of a complex manifold), §4.1 (holomorphic vector bundles and their section
sheaves), §5.1 (density bundles, bundle test spaces with their LF topology and universal property,
bundle distributions and their finite order), §5.2 (local structure of distributions, point-supported
distributions as finite sums of derivatives of `δ`, interval cutoffs and extension by zero, the
`exp(1/‖x‖²)` nonextension example), §5.3 (the Fréchet topology on smooth sections, its Montel property
and its continuous dual as compactly supported distributions), §5.10 (compact Serre duality, distinct from
§2.0f).

### From TauCetiRoadmap.GlobalHolomorphicFunctions

§0.3 (the compact-support Cauchy–Green formula `∂̄Tφ = φ`), §7.1 (for every open `Ω ⊆ ℂ` and smooth `f`
there is a smooth `g` with `∂̄g = f`), §7.4 (Cousin I on open subsets of `ℂ`: every holomorphic additive
`1`-cocycle on an open cover is a coboundary).

### From TauCetiRoadmap.PseudodifferentialOperators

Conventions (the angular-frequency phase and the change of frequency to Mathlib's convention), §P1.0
(differential operators on bundles and their density transpose), §6.2 (local distributional elliptic
regularity), §§9.1–9.2 (the smooth wavefront set, distribution pullback under `WF(u) ∩ N_f = ∅` and
products under `WF(u) ∩ −WF(v) = ∅`).

### From TauCetiRoadmap.BanachSpaceTheory

B1 (the adjoint `ContinuousLinearMap.precomp 𝕜 T`, its norm and composition, naturality of the canonical
bidual embedding, norming by the dual ball), B2 (Gantmacher's criterion `T**(E**) ⊆ J_F(F)` for weakly
compact `T`, and compact implies weakly compact).

### From TauCetiRoadmap.ComplexComparisonPartII

§C6.1, for sheaves of modules over a commutative ring, here `ℂ`, on locally compact Hausdorff spaces:
the stalks of extension by zero `j_!` along an open inclusion (`F_x` on the open, zero off it) and its
section formula; c-soft resolutions and derived compact-support sections `RΓ_c`, with
`RΓ_c(U, F|_U) ≅ RΓ_c(X, j_!F)` and the localization triangle
`RΓ_c(U, F|_U) → RΓ_c(X, F) → RΓ_c(Z, F|_Z)` for the closed complement `Z`; and `Rf_!` for locally
proper separated continuous maps between such spaces that are paracompact and locally contractible,
with composition, agreement with the direct image for proper maps, and base change.

## References

- N. Honda, T. Izawa and T. Suwa, *Sato hyperfunctions via relative Dolbeault cohomology*,
  [arXiv:1807.01831](https://arxiv.org/html/1807.01831): the relative representative, local duality and
  embedding conventions; Theorem 2.14 quotes the classical purity and flabbiness theorems.
- Y. Ito, *Theory of (vector valued) Sato hyperfunctions*, J. Math. Tokushima Univ. 20 (1986), §§1.5–1.6:
  the route from compact duality to purity by boundary supports.
- H. Komatsu, *Projective and injective limits of weakly compact sequences of locally convex
  spaces*, J. Math. Soc. Japan 19 (1967), 366–383,
  [doi:10.2969/jmsj/01930366](https://doi.org/10.2969/jmsj/01930366): Theorems 6′ and 12 (pp. 375 and
  377), inductive limits of compact sequences of Banach spaces and their strong duals; Theorem 19
  (p. 381), closed range and duality for FS and DFS complexes.
- B. Malgrange, *Faisceaux sur des variétés analytiques réelles*, Bull. Soc. Math. France 85 (1957),
  231–237, Lemme 3, part a (pp. 235–236): `H^p(Ω, O) = 0` for `p ≥ n` on every open `Ω ⊆ ℂⁿ`.
- M. Sato, T. Kawai and M. Kashiwara, "Microfunctions and pseudo-differential equations", in
  *Hyperfunctions and Pseudo-Differential Equations*, Lecture Notes in Mathematics 287 (1973), 265–529:
  microfunctions, analytic wavefronts and noncharacteristic operations.
- M. Kashiwara and P. Schapira, *Sheaves on Manifolds*, Chapters III–IV: conic sheaves, specialization
  and the Fourier–Sato transform.
