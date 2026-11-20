# Roadmap: spectral manifolds and reconstruction

**Summary.** A spectral triple consists of a unital star algebra 𝒜 faithfully represented on a
separable Hilbert space H and an unbounded self-adjoint operator D with compact resolvent whose
commutators with the elements of 𝒜 are bounded. The model is a closed Riemannian spin manifold, with
𝒜 its smooth functions, H its square-integrable spinors and D its Dirac operator. This roadmap
develops the geometric conditions such a triple can satisfy (a dimension p, regularity, finiteness and
absolute continuity, a first-order condition, an orientation given by a Hochschild cycle, a real
structure, Poincaré duality), proves that commutative spectral data satisfying them come from a
manifold, and recovers its geometry.

The first main theorem is Connes' reconstruction theorem. Let 𝒜 be commutative and p ≥ 1 an integer.
Suppose that the eigenvalues of D grow at least like j^(1/p), that every module endomorphism of the
smooth core of D is regular (strong regularity), that the smooth core is a finitely generated
projective 𝒜-module whose inner products are computed by the Dixmier trace of |D|^(−p), that
commutators with D commute with 𝒜, and that some antisymmetric Hochschild p-cycle is represented by
the grading when p is even and by the identity when p is odd. Then the spectrum of the norm closure
of 𝒜 has a unique structure of compact oriented smooth p-manifold X for which 𝒜 is exactly the
algebra of smooth functions. Conversely every closed oriented manifold arises, through its signature
operator.

The second main theorem recovers the rest. Under the same hypotheses H is the space of
square-integrable sections of a Hermitian bundle E, D is a first-order operator of Dirac type, and
the squares of its commutators with real functions define a Riemannian metric g. The distance
`sup{|f(x) − f(y)| : ‖[D, f]‖ ≤ 1}` is the geodesic distance, and the Dixmier trace of `a|D|^(−p)` is
the integral of `a · rank E` against the volume of g, times `vol(S^(p−1))/(p(2π)^p)`. The third
identifies spinor bundles: if E is an irreducible Clifford module, X carries a Spinᶜ structure and D
is a Spinᶜ Dirac operator plus a symmetric zero-order term; a compatible real structure of
KO-dimension p reduces it to a Spin structure. The roadmap also proves the open mapping and closed
graph theorems for complete metrizable topological vector spaces over ℝ or ℂ.

The spectral triples, Dixmier traces and cyclic theory come from
[NoncommutativeGeometry](../NoncommutativeGeometry/README.md).
[OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md) and
[SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md) supply the singular
values and spectral multiplicity behind Voiculescu's multiplicity formula.
[PseudodifferentialOperators](../PseudodifferentialOperators/README.md) and
[SpinGeometry](../SpinGeometry/README.md) supply the elliptic theory and Dirac operators,
[CompactQuantumMetricSpaces](../CompactQuantumMetricSpaces/README.md) and
[RiemannianGeometry](../RiemannianGeometry/README.md) the identification of the spectral distance, and
[OperatorKTheory](../OperatorKTheory/README.md) the KK-theory of the fundamental class.

Layers 1–2 set up the structures and the axiom packages; Layers 3–5 build the functional analysis,
the Lorentz-ideal estimates and the flows of spectral derivations on the spectrum; Layer 6 proves the
reconstruction; Layer 7 recovers bundle, metric, measure and distance; Layer 8 treats Spinᶜ and Spin;
Layer 9 fundamental classes and duality; Layer 10 products; Layer 11 finite models and examples.

## How to read the build

Layer 1 uses only NoncommutativeGeometry N5 and the native operators. Layer 2 states the geometric
conditions independently; Layer 3 builds their module and function-algebra consequences. The generic
ideal and modulus theory of Layer 4 (§§4.1–4.4) uses OperatorIdeals, SelfAdjointSpectralTheory SA-B85
and VonNeumannAlgebras V4; its local spectral estimate (§4.5) uses Layer 3, and is applied only after
Layers 5 and 6 have produced Lebesgue spectrum and the lower count (§6.4). The spectral derivations of
Layer 5 use Layer 3 and Tau Ceti's semigroup generation theorems, not vector fields on a reconstructed
manifold. Layer 6 uses Layers 3–5. The geometric heat and symbol comparisons of §7.6 for operators
given on a manifold use the shared analytic scale of ComplexKahlerGeometry K5a,
PseudodifferentialOperators and the SpinGeometry and SmoothBundlesConnections foundations, independently
of Layer 6, while the rest of Layer 7 follows Layer 6; so the converse §6.8 can use §7.6 without a
cycle. Layer 8 uses Layers 6–7, the early generic Spinᶜ foundation of FourManifolds F4 (not its
four-dimensional applications) and SpinGeometry's Spin lifts and Clifford modules. Layer 9 follows the
geometric layers and the KK suppliers; neither Layer 6 nor its analytic prerequisites use the duality
axiom. The core products of Layer 10 (§§10.1–10.5) use Layers 1–2 and NoncommutativeGeometry N5; their
geometric refinement (§10.6) uses Layers 7–9. Layer 11 calibrates the constructions and does not
supply the general reconstruction proof. Each section's *Needs:* line lists what its statement and
route use, so that a target proved by another route is not blocked behind an unrelated layer.

`Suggested.lean` is the acceptance test of this roadmap: it states, with `sorry`, the open mapping and
closed graph theorems of §3.2, and its module docstring names the headline theorems that cannot yet be
stated against the pinned libraries and what each lacks.

## Conventions

1. **Hilbert spaces and algebras.** H is a separable complex Hilbert space with inner product
   conjugate-linear in the first slot (Mathlib's convention); 𝒜 is a unital complex star algebra with
   a faithful unital star representation π on H, and 𝒜 is identified with π(𝒜) through that
   injectivity. Its norm closure is the C*-algebra `A`, and `A″` is its bicommutant.
2. **The operator.** D is a densely defined self-adjoint operator, a Mathlib `LinearPMap`
   `H →ₗ.[ℂ] H`, and a spectral triple is one of NoncommutativeGeometry N5. Compact resolvent is
   Tau Ceti's `LinearPMap.HasCompactResolvent`: compactness of one resolvent, equivalently of all, and
   unchanged under `D ↦ −D`; in particular compactness of `(D − i)⁻¹`, although Tau Ceti's
   `LinearPMap.resolvent D i` inverts `i − D` and differs from it by a sign. Functions of D (|D|, Λ,
   heat operators, inverse powers) come from NoncommutativeGeometry N5's eigenbasis-independent
   calculus; equality of domains is proved before partial operators are compared.
3. **Dimensions and manifolds.** The geometric dimension p is a positive integer, except in the
   dimension-zero construction of §11.3. H is nonzero in positive-dimensional geometric packages.
   Reconstructed manifolds are compact Hausdorff second-countable smooth real manifolds without
   boundary, of dimension p; connectedness is assumed only where it is stated. Bundle ranks may be
   positive locally constant functions on a disconnected base.
4. **Powers and singular values.** `Λ = (1 + D²)^(1/2)`. The operator `|D|^(−p)` is extended by zero on
   the finite-dimensional kernel of D; the kernel is kept in domain, index and eigenvalue statements,
   and a modification of D on its kernel changes singular-trace expressions by a finite-rank operator,
   not the original kernel or index. Norms, summability and local estimates use the zero-based
   singular values `μ_j`, `μ₀(T) = ‖T‖` (Tau Ceti's `ContinuousLinearMap.singularValue`).
5. **Strengthened hypotheses.** The reconstruction theorem has definite strengthened hypotheses:
   ordinary regularity is not substituted for regularity of every module endomorphism of the smooth
   core, and an arbitrary Hochschild orientation cycle is not silently antisymmetrized.
6. **Three separate data.** Spectral parity (whether a grading γ is part of the data), metric
   dimension p and, for a real structure, KO-dimension n mod 8 are independent data (§1.4). Even and
   odd always refer to spectral parity unless metric dimension is named.
7. **Clifford conventions.** The geometric Clifford convention is negative:
   `c(α)c(β) + c(β)c(α) = −2 g*(α, β) Id`, with `c(α)* = −c(α)` for real α. For an oriented
   orthonormal coframe, `Γ = i^(−p(p+1)/2) c(e₁) ⋯ c(e_p)`; then `Γ* = Γ`, `Γ² = 1`, it agrees with
   SpinGeometry's even-dimensional chirality and fixes the odd Clifford factor by `Γ = +1`. In odd
   dimension `p = 2ℓ + 1`, SpinGeometry uses `ω_Spin = i^(ℓ+1) c(e₁) ⋯ c(e_p)`, and
   `Γ = (−1)^(ℓ+1) ω_Spin` (§1.7). OperatorKTheory and GeneralizedCohomology use the positive
   convention `e_i² = 1` for the Clifford algebras of KK- and KO-degrees; every comparison with
   their classes states the translation. Native `CliffordAlgebra` maps, units and coercions are
   used, never a private algebra.
8. **Products and Fourier conventions.** Products are ordered first factor, then second, with the
   Pauli matrices `σ₁ = [[0, 1], [1, 0]]`, `σ₂ = [[0, −i], [i, 0]]`, `σ₃ = diag(1, −1)`. Principal
   symbols are PseudodifferentialOperators' Fourier principal symbols (`∂_j` has symbol `iξ_j`);
   Fourier phases follow Mathlib's `2π` convention, which that roadmap uses to implement them.
9. **Native carriers.** Mathlib's `ContMDiffSection`, `ContMDiffMap`, `FiberBundleCore`, `VectorBundle`,
   `ContMDiffVectorBundle`, `CliffordAlgebra`, `MultilinearMap`, `Derivation`, `Ideal.Cotangent`,
   `Module.Projective`, `Module.Finite` and `LinearPMap` determine the interface. Tau Ceti's
   `LinearPMap.resolvent` is the bounded inverse with its topological domain hypotheses; for an
   everywhere-defined continuous operator it agrees with Mathlib's algebraic resolvent
   (`ContinuousLinearMap.resolvent_toPMap_top`). Algebraic tensor products of inner product spaces
   carry Mathlib's inner product; their completion is the Hilbert tensor product of VonNeumannAlgebras
   V2. An algebraic tensor product of smooth function algebras is not the smooth functions on the
   product manifold: the smooth product uses NoncommutativeGeometry N1's completed projective tensor
   product and the identification of §10.6. A spectral-geometric carrier that these libraries lack is
   built in Tau Ceti as a target of this roadmap or of a named supplier, following Mathlib's design
   where Mathlib has one.

## Layer 1: geometric structures on the spectral core

This layer adds to the spectral triples of NoncommutativeGeometry N5 the structure every later layer
uses: isomorphisms, the smooth core, the `D²`-test for regularity, gradings, real structures and the
opposite action. It extends that carrier and does not copy it: no second spectral-triple or
unbounded-operator carrier is introduced (Connes 2008; for the signs, Dąbrowski–Dossena §§2–5 and
Ćaćić 2012, §§2.1–2.4).

### 1.1 Isomorphisms of represented triples

Define an isomorphism of represented triples `(𝒜₁, H₁, D₁) → (𝒜₂, H₂, D₂)` as a pair of a unital
star algebra isomorphism `φ : 𝒜₁ ≃ 𝒜₂` and a unitary `U : H₁ → H₂` with `U π₁(a) U⁻¹ = π₂(φ a)` for
every `a`, `U (Dom D₁) = Dom D₂` and `U D₁ U⁻¹ = D₂` on `Dom D₂`. For graded triples require in addition
`U γ₁ U⁻¹ = γ₂`, and for real triples `U J₁ U⁻¹ = J₂` (Connes 2008).
*Needs:* NoncommutativeGeometry N5 spectral triples; Mathlib `StarAlgEquiv`, `LinearIsometryEquiv`,
`LinearPMap`.

It comes with the following API.
- The identity, the composite of two isomorphisms and the inverse of an isomorphism are isomorphisms,
  and two isomorphisms with the same algebra map and the same unitary are equal; the isomorphisms of
  triples form a groupoid.
- Every condition of Layers 1 and 2 (regularity, dimension, finiteness, absolute continuity, order
  one, orientation, parity and real structure) transports along an isomorphism.
- A unital star homomorphism of algebras alone is not declared to intertwine Dirac operators: a
  morphism of triples always carries its unitary and the equality of transported domains.

**Checks.**
- On the circle triple `(C∞(S¹), L²(S¹), i d/dt)`, the rotation `t ↦ t + s` gives an isomorphism
  (translation commutes with `d/dt`). The reflection `t ↦ −t` underlies none: every unitary
  implementing it is the reflection `P` followed by a unitary multiplication operator, and conjugates
  `D` to `−D` plus a multiplication operator. A definition that asked only for an algebra
  automorphism would accept the reflection.

### 1.2 The smooth core

Define the smooth core `H∞ = ⋂_(m≥0) Dom Dᵐ` with the seminorms `ξ ↦ ‖Λᵐ ξ‖`, `m ≥ 0`, where
`Λ = (1 + D²)^(1/2)` (Convention 4) (Connes 2008).
*Needs:* NoncommutativeGeometry N5 closed `δ`-domain, graph seminorms and iterated commutator
estimates; Mathlib `LinearPMap`, `WithSeminorms`; §3.1 for the metric and completeness, §3.6 for
nuclearity.

It comes with the following API.
- `H∞` is dense in `H` and in the graph domain of every power `Dᵐ`, and complete for its seminorms.
- The seminorm families `‖Λᵐ ·‖` and `‖ξ‖ + ‖|D|ᵐ ξ‖` define the same topology on `H∞`.
- If the eigenvalue counting function of `D` grows at most like a power (the dimension bound of §2.1
  with `p ≥ 1`), `H∞` is a nuclear Fréchet space.
- For a regular triple, `π(𝒜)` preserves `H∞` and acts continuously on it (from the iterated
  commutator estimates of NoncommutativeGeometry N5); `D` restricts to a continuous map `H∞ → H∞`;
  every bounded operator in the domain of every power of `δ` preserves `H∞` and acts continuously.
- Powers, domains and restrictions of the partial operators used later compare as expected: the
  domain of `Dᵐ` is the domain of `Λᵐ`, a restriction of `D` to `H∞` has closure `D`, and the
  domains of `D²` and `Λ²` agree.

**Checks.**
- For `D = i d/dt` on `L²(S¹)`, `H∞` is `C∞(S¹)` (Fourier coefficients of rapid decay) and `Λᵐ` acts
  on `e^(int)` by `(1 + n²)^(m/2)`; a definition with only finitely many seminorms would give a
  Sobolev space instead.

### 1.3 The `D²`-test for regularity

On the common smooth core define `δ₁(T) = [D², T] Λ⁻¹`. Prove that a bounded operator `T` lies in
the domain of every power of `δ₁` if and only if it lies in the domain of every power of
`δ(T) = [|D|, T]`, with domain invariance and the estimates
`‖δⁿ(T)‖ ≤ Σ_(k≤2n) C_(n,k) ‖δ₁ᵏ(T)‖` (Connes 2008). *Route:* the resolvent integral for `D² Λ⁻¹`,
with the bounded difference `D² Λ⁻¹ − |D|`, which commutes with `D` and handles the finite kernel.
This is the `D²`-symbol (filtration) test used for regularity in Layers 6, 7 and 10.
*Needs:* §1.2; NoncommutativeGeometry N5 `δ` and its closed domain; SelfAdjointSpectralTheory Parts
C–E functional calculus of `D`.

**Checks.**
- On the circle with `D = i d/dt` and `T` multiplication by `e^(it)`:
  `δ(T) e^(int) = (|n+1| − |n|) e^(i(n+1)t)`, of norm `1`, and
  `δ₁(T) e^(int) = ((n+1)² − n²)(1 + n²)^(−1/2) e^(i(n+1)t)`, also bounded. With `[D², T]` alone (no
  `Λ⁻¹`) the commutator `(2n + 1) e^(i(n+1)t)` is unbounded: the factor `Λ⁻¹` is what makes the test
  one of order zero.

### 1.4 Gradings and spectral parity

An **even** triple carries a self-adjoint unitary `γ` commuting with `π(𝒜)`, preserving `Dom D` and
satisfying `Dγ = −γD` there; one of its eigenspaces may be zero, as finite models need. An **odd**
triple has no grading in its data. This *spectral parity* (presence of `γ`) is one of three separate
data, with the metric dimension `p` of §2.1 and, for a real structure, its KO-dimension `n mod 8`.
A real structure of KO-dimension `n` is defined on an even triple when `n` is even and on an odd
triple when `n` is odd (Ćaćić 2012, Definition 2.5); a grading that a triple with odd `n` happens to
carry is not part of its real-structure data. The metric dimension is tied to neither: the strongly
oriented package of §2.5 has spectral parity `p mod 2`, so its real refinements have `n ≡ p mod 2`,
while the weakly oriented package of §2.6 keeps `p` independent of the spectral parity and of `n`.
The represented orientation operator `χ = π_D(c)` of §2.5 is a further object: it is the grading only
in the strongly oriented even case.
*Needs:* NoncommutativeGeometry N5 spectral triples.

**Checks.**
- The full Hodge–de Rham triple of a closed oriented manifold of odd dimension `p`, graded by
  exterior parity and with complex conjugation, is an even real triple of KO-dimension `0` and
  metric dimension `p` (Ćaćić 2012, Example 2.9); it is weakly but not strongly oriented. A
  definition tying spectral parity to `p mod 2` would reject it.
- The Spin Dirac triple of a closed Spin `p`-manifold has `n = p` and spectral parity `p mod 2`.
- Replacing `γ` by `−γ` keeps every real structure of even KO-dimension, with the same `ε″`
  (`J(−γ) = ε″(−γ)J`), and reverses the sign of a strong orientation.

### 1.5 Real structures and the KO sign table

A real structure is an antiunitary `J : H ≃ₗᵢ⋆[ℂ] H` with `J (Dom D) = Dom D` and

`J² = ε Id,  JD = ε′ DJ,  Jγ = ε″ γJ` (the last only for even `n`, where the triple carries `γ`).

The signs are the conventional ones (Dąbrowski–Dossena §§2–5; Ćaćić 2012, Definition 2.5):

| KO n mod 8 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| ε | +1 | +1 | −1 | −1 | −1 | −1 | +1 | +1 |
| ε′ | +1 | −1 | +1 | +1 | +1 | −1 | +1 | +1 |
| ε″ | +1 | — | −1 | — | +1 | — | −1 | — |

The rows are the sign functions `ε(n)` and `ε′(n)` of `n mod 8` and `ε″(2k)` of `k mod 4`. A real
structure of KO-dimension `n` is an antiunitary satisfying the first two equations at the signs of
column `n`, so `ε` and `ε′` are not chosen apart from `n`; in even KO-dimension `n = 2k` its data also
contain a grading of `D` and the third equation at the sign `ε″(2k)`, so `ε″` and `γ` occur exactly in
even KO-dimension. Neither datum records the metric dimension. For even `n`, also construct the
alternative real structure `Jγ`, and prove that it satisfies the three equations with the signs
`(εε″, −ε′, ε″)`.
*Needs:* §1.4; Mathlib `LinearIsometryEquiv` (antiunitaries `H ≃ₗᵢ⋆[ℂ] H`).

**Checks.**
- For even `n` the alternative structure has `(Jγ)² = ε″ε`, `(Jγ)D = −ε′ D(Jγ)` and
  `(Jγ)γ = ε″ γ(Jγ)`; at `n = 0, 2, 4, 6` this gives `(+1, −1, +1)`, `(+1, −1, −1)`,
  `(−1, −1, +1)`, `(−1, −1, −1)`. A computation that commuted `γ` past `J` without the sign `ε″`
  would give `(Jγ)² = ε` instead.
- On the circle with the periodic spin structure, `D = i d/dt` and `J` complex conjugation of
  functions: `J² = 1` and `JD = −DJ`, the signs `(ε, ε′) = (+1, −1)` of `n = 1`.

### 1.6 The opposite action, order zero and first order

Given a real structure, define `b° = J π(b*) J⁻¹`. Prove that `b ↦ b°` is a complex-linear unital
star representation of `𝒜ᵒᵖ` (Dąbrowski–Dossena §§2–5). The **order-zero condition** is
`[π(a), b°] = 0` and the **real first-order condition** is `[[D, π(a)], b°] = 0`, for all `a, b`.
*Needs:* §1.5; NoncommutativeGeometry N5 bounded commutators.

It comes with the following API.
- From `JD = ε′DJ`: `b°` preserves `Dom D` and `[D, b°] = ε′ J [D, π(b*)] J⁻¹`, a bounded operator;
  these right bounded-commutator and domain identities are what the bimodule KK class of §9.1 needs.
- The opposite action of the conjugate triple, of a unitarily transported triple and of the
  alternative structure `Jγ` of §1.5, each with its actual sign.
- The fixed algebra `{a : J π(a*) J⁻¹ = π(a)}` is a star subalgebra, central under the order-zero
  condition. In a commutative geometric real refinement this fixed algebra is required to equal `𝒜`,
  not merely to lie in its centre.

**Checks.**
- Under `J`, `b ↦ J π(b) J⁻¹` (without the star) is conjugate-linear; with the star it is complex
  linear and reverses products, `(bc)° = c° b°`: the definition is a representation of `𝒜ᵒᵖ`, not of
  `𝒜`.
- For `M_n(ℂ)` acting on its Hilbert–Schmidt space by left multiplication with `J(x) = x*`,
  `b°(x) = x b`: right multiplication, which commutes with every left multiplication (order zero).

### 1.7 The Clifford volume element

For an oriented orthonormal coframe `e₁, …, e_p` put `Γ = i^(−p(p+1)/2) c(e₁) ⋯ c(e_p)` in the
Clifford convention of Convention 7. Prove `Γ* = Γ`, `Γ² = 1`, that `Γ` does not depend on the
oriented orthonormal coframe, that it agrees with SpinGeometry's chirality in even dimension, and,
in odd dimension `p = 2ℓ + 1`, that `Γ = (−1)^(ℓ+1) ω_Spin` with `ω_Spin = i^(ℓ+1) c(e₁) ⋯ c(e_p)`
the volume element of SpinGeometry G1.4; equivalently, `Γ` is Tau Ceti's
`CliffordAlgebra.complexVolume` in even dimension and `(−1)^(ℓ+1)` times it in odd dimension. Thus
`Γ = +1` selects the factor on which `ω_Spin = (−1)^(ℓ+1)`. This dictionary is used in the odd
restriction, product and charge-conjugation comparisons of Layers 6, 8 and 10.
*Needs:* Mathlib `CliffordAlgebra`; Tau Ceti `CliffordAlgebra.complexVolume`; SpinGeometry G1.4 and
G2.1 (volume element and chirality).

**Checks.**
- `Γ² = 1`: `(c(e₁) ⋯ c(e_p))² = (−1)^(p(p−1)/2) (−1)^p = (−1)^(p(p+1)/2)`, cancelled by
  `(i^(−p(p+1)/2))² = (−1)^(p(p+1)/2)`. Without the phase, `(c(e₁)c(e₂))² = −1` in dimension `2`.
- For `p = 1`, `Γ = −i c(dt)`; with `c(dt) = i`, `Γ = 1`, and with `c(dt) = −i`, `Γ = −1`.
- For `p = 3` (`ℓ = 1`), `Γ = −c(e₁)c(e₂)c(e₃)` (as `i^(−6) = −1`) and `ω_Spin = −c(e₁)c(e₂)c(e₃)`,
  so `Γ = ω_Spin = (−1)^(ℓ+1) ω_Spin`; for `p = 1` (`ℓ = 0`), `Γ = −i c(e₁) = −ω_Spin`.

### Examples

- The circle triple `(C∞(S¹), L²(S¹), i d/dt)` is odd, regular, with smooth core `C∞(S¹)`; its
  rotations are isomorphisms of triples.
- The finite triple `(ℂ², ℂ², [[0, m], [m̄, 0]])` with `γ = diag(1, −1)` is even: `γ` commutes with the
  diagonal algebra and anticommutes with `D`.
- `M_n(ℂ)` on its Hilbert–Schmidt space with `J(x) = x*` and `D = 0` is a real triple satisfying the
  order-zero and first-order conditions.

### Dependencies

NoncommutativeGeometry N5 (spectral triples, regularity, the derivation `δ` and its estimates),
SelfAdjointSpectralTheory Parts C–E (functional calculus and domains of unbounded self-adjoint
operators), SpinGeometry G1.4 and G2.1 for §1.7, Mathlib's `LinearPMap`, `StarAlgEquiv`,
`LinearIsometryEquiv` and `CliffordAlgebra`. The nuclearity clause of §1.2 uses §§2.1, 3.1 and 3.6;
nothing else of later layers is used.

## Layer 2: finite, oriented and real geometric axiom packages

The geometric conditions are stated independently, each as a predicate on a spectral triple of
NoncommutativeGeometry N5 (with the grading or real structure of Layer 1 where it enters), with
forgetful maps between the packages that combine them. The conventional seven-axiom presentation
groups them as dimension, regularity, finiteness and absolute continuity, reality, first order,
orientability and Poincaré duality (Connes 2008); Layer 9 states the last precisely. The commutative
reconstruction of Layer 6 uses the five conditions of §§2.1–2.5 and assumes neither reality nor
Poincaré duality. The **strongly regular commutative package of dimension `p`** is a commutative
triple satisfying §2.1 at `p`, §2.2 with endomorphism regularity, §2.3, §2.4 and §2.5 in its
strongly oriented form; the weakly oriented package is §2.6.

### 2.1 Dimension

The **dimension condition** at `p ≥ 1` is `sup_j (j + 1)^(1/p) μ_j(Λ⁻¹) < ∞`, with `μ_j` the
zero-based singular values (Connes 2008). Prove that it is equivalent to a counting bound
`N_D(R) ≤ C (1 + R)ᵖ`, where `N_D(R)` is the number of eigenvalues of `D` of absolute value at most
`R`, counted with multiplicity; that it is unchanged when `D` is modified on its finite kernel by a
finite-rank operator; and that it puts `|D|⁻ᵖ` in the logarithmic ideal of NoncommutativeGeometry
N4. For `p = 1` the condition is membership of `Λ⁻¹` in the weak ideal `μ_j = O(1/(j + 1))`, which
is stronger than membership of `|D|⁻¹` in the logarithmic ideal. Derive that `Λ⁻¹` lies in the
Schatten class `S_q` for every `q > p` and that `Tr e^(−tD²) < ∞` for every `t > 0`. The condition
is an upper bound only: the nonzero lower counting bound is proved in §6.4, not built into it.
*Needs:* NoncommutativeGeometry N5 compact resolvent and eigenbasis calculus; Tau Ceti
`ContinuousLinearMap.singularValue`, `TauCeti.OperatorIdealFamily.logarithmic`,
`TauCeti.OperatorIdealFamily.schatten`.

**Checks.**
- On the circle, `D = i d/dt` has eigenvalues `n ∈ ℤ`, so `N_D(R) = 2⌊R⌋ + 1 ≤ 3(1 + R)`: dimension
  `1`. On the flat torus `ℝ²/2πℤ²` with its Dirac operator, `N_D(R)` counts lattice points in a disc
  and grows like `πR²` times the rank `2`: dimension `2`, and not dimension `1`.
- The circle also satisfies the condition at every `p > 1`, since the bound is only an upper bound;
  a definition reading `p` off the condition would be ambiguous, which is why §6.4 proves the
  lower count.

### 2.2 Regularity and endomorphism regularity

Regularity is that of NoncommutativeGeometry N5: `π(a)` and `[D, π(a)]` lie in the domain of every
power of `δ`, with its closed graph-seminorm topology. Define **endomorphism regularity**: every
algebraic 𝒜-linear endomorphism of `H∞` extends to a bounded operator on `H` lying in the domain of
every power of `δ`. The **strongly regular** package includes both ordinary regularity and
endomorphism regularity (Connes 2008). In the finite Hermitian setting of §2.3 the bounded extension
is a theorem (§3.4), not an extra boundedness choice.
*Needs:* §§1.2–1.3; NoncommutativeGeometry N5 regularity.

It comes with the following API.
- Matrices over regular endomorphisms, adjoints, composites and restrictions to reducing subspaces
  of endomorphism-regular operators are endomorphism-regular, and the condition transports along
  isomorphisms of triples (§1.1).
- In the commutative order-one case (§2.4), multiplication by `a` and `[D, a]` are 𝒜-linear
  endomorphisms of `H∞`, so endomorphism regularity implies ordinary regularity there. For a
  noncommutative represented left action these operators need not be 𝒜-linear, and ordinary
  regularity is kept as a separate input.
- An arbitrary regular bounded perturbation of `D` is not asserted to preserve the geometric
  conditions; the perturbations that do are those of §7.8.

**Checks.**
- On the circle, every `C∞(S¹)`-linear endomorphism of `H∞ = C∞(S¹)` is multiplication by a smooth
  function, and `δ` of a smooth multiplication operator is bounded with smooth iterates: the circle
  triple is strongly regular.
- For `M_n(ℂ)` acting on `ℂⁿ` by matrices (`n ≥ 2`, `D = 0`), the 𝒜-linear endomorphisms are the
  scalars while `π(a)` is not 𝒜-linear: endomorphism regularity says nothing about `π(a)` there.

### 2.3 Finiteness and absolute continuity

Use the represented **left** 𝒜-action. **Finiteness** is the datum of an integer `N`, a
self-adjoint idempotent `e ∈ M_N(𝒜)` and a left-module isomorphism `H∞ ≃ 𝒜ᴺ e` (row vectors, the
matrix acting on the right). Its Hermitian form, conjugate-linear in the first argument, is
`h(ξ, η) = Σ_i η_i ξ_i*`, so that `h(aξ, bη) = b h(ξ, η) a*` (Connes 2008).
*Needs:* §§1.2, 2.2; NoncommutativeGeometry N4 linear Dixmier trace; §4.4 for the choice of `Tr_ω`;
HilbertModules H1 for the opposite-algebra convention; Mathlib `Matrix.mulVecLin_transpose`,
`IsStarProjection`, `isStarProjection_iff'`, `Matrix.star_eq_conjTranspose`.

It comes with the following API.
- `h` is positive in `A`, nondegenerate, and satisfies the left finite-frame identities.
- In the commutative case put `f = eᵀ`. The complex-linear 𝒜-module map `v ↦ vᵀ` identifies the rows
  `𝒜ᴺ e` with the column model `f 𝒜ᴺ`, because `(ve)ᵀ = f vᵀ`, with inverse the transpose;
  `f² = f = f*`, and the transported form is `Σ_i ξ_i* η_i`. The row-column comparison of linear
  maps is Mathlib's `Matrix.mulVecLin_transpose` (commutative scalars); the projection condition is
  Mathlib's `IsStarProjection`, compared with the displayed equations through
  `isStarProjection_iff'` and `Matrix.star_eq_conjTranspose`. The column model is recorded by a
  matrix `f` satisfying this predicate together with an 𝒜-linear isomorphism of `H∞` onto `f 𝒜ᴺ`.
- A Hermitian `e` has `eᵀ = ē` (entrywise adjoint), not `eᵀ = e`. Conjugate transpose is
  conjugate-linear and is not this module isomorphism. Over a noncommutative 𝒜 the left-row
  convention is kept: the transpose comparison needs commutativity.
- For real triples, the right action through `J` (§1.6) is compared with the opposite-algebra
  right-module convention of HilbertModules H1 (Mathlib's `CStarModule` over `𝒜ᵐᵒᵖ`); the right-module
  inner-product formula is never used with the represented left action.

Fix a Dixmier trace `Tr_ω` of NoncommutativeGeometry N4 obtained from the logarithmic Cesàro
generalized limit of §4.4. **Absolute continuity** is the equation

`⟨ξ, π(a) η⟩ = Tr_ω(π(a h(ξ, η)) |D|⁻ᵖ)` for all `a ∈ 𝒜` and `ξ, η ∈ H∞`,

with the left-Hermitian convention above. Define `τ_D(a) = Tr_ω(π(a) |D|⁻ᵖ)`. Prove that `τ_D` is
positive, continuous on `A` and, in the commutative case, faithful (full support), using the
faithful `π` and the finite frame. Prove that `τ_D` is a trace on the regular smooth algebra, by
showing that `[|D|⁻ᵖ, π(a)]` is trace class from the iterated commutator and ideal estimates of
NoncommutativeGeometry N5, before trace cyclicity is used in noncommutative examples. The `A`-valued
form is not replaced by a Hilbert-valued inner product. The reconstruction may fix one such `ω`;
independence of the generalized limit is a measurability conclusion, proved for the geometric
operators in §7.6.

**Checks.**
- `e = ½ [[1, i], [−i, 1]]` is a Hermitian idempotent in `M₂(ℂ)` with
  `eᵀ = ½ [[1, −i], [i, 1]] = ē ≠ e`; a column model built with `f = e` instead of `eᵀ` would not be
  the image of the rows `ℂ² e`.
- With `N = 1`, `e = 1` and `𝒜 = C∞(X)`, `h(ξ, η) = η ξ̄`, and the right side of absolute continuity
  is conjugate-linear in `ξ` like the inner product; the form `ξ η̄` would make it conjugate-linear in
  `η` and the equation false for `a = 1` and `η = iξ`.
- On the circle with `D = i d/dt` on `L²(S¹, dt)`, `Tr_ω(π(a)|D|⁻¹) = π⁻¹ ∫ a dt` (§7.6), so absolute
  continuity holds with the module isomorphism `ξ ↦ √π ξ` onto `C∞(S¹)`, for which
  `h(ξ, η) = π η ξ̄`, and fails with the identity: the normalization of the frame is part of the
  datum.

### 2.4 Order one

In the commutative package the **order-one condition** is `[[D, a], b] = 0` for all `a, b ∈ 𝒜`; in
the real noncommutative package it is the real first-order condition of §1.6 with the right action
`b°` (Connes 2008). Give the derivation, module and adjoint identities on `H∞` and on `Dom D` before
passing to bounded extensions: `a ↦ [D, a]` is a derivation, 𝒜-linear in the commutative case, and
`[D, a]* = −[D, a*]` on `Dom D`.
*Needs:* §§1.2, 1.6.

**Checks.**
- On the circle, `[i d/dt, a] = i a′` is a multiplication operator, so `[[D, a], b] = 0`; for the
  Laplacian `D² = −d²/dt²` the commutator `[D², a] = −a″ − 2a′ d/dt` is a first-order operator and
  `[[D², a], b] = −2a′b′ ≠ 0` in general: order one distinguishes Dirac-type from Laplace-type
  operators.

### 2.5 Orientation

Hochschild chains are taken with bimodule coefficients: for an 𝒜-bimodule `M`, the `p`-chains are
`M ⊗ 𝒜^(⊗p)` with boundary

`b(m ⊗ a₁ ⊗ ⋯ ⊗ a_p) = m a₁ ⊗ a₂ ⊗ ⋯ ⊗ a_p + Σ_(j=1)^(p−1) (−1)ʲ m ⊗ ⋯ ⊗ a_j a_(j+1) ⊗ ⋯ + (−1)ᵖ a_p m ⊗ a₁ ⊗ ⋯ ⊗ a_(p−1)`.

For coefficients `M = 𝒜` the quotient by degenerate tensors is Tau Ceti's
`TauCeti.normalizedHochschildChains`, and the boundaries agree. The represented chain map is
`π_D(a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_p) = π(a₀) [D, π(a₁)] ⋯ [D, π(a_p)]` (Connes 2008).

For commutative 𝒜 an **orientation** is a finite `p`-chain `c` with coefficients `𝒜`,
antisymmetric in its last `p` entries, with `bc = 0`. In the **strongly oriented** package the
triple is even with `π_D(c) = γ` when `p` is even, and odd with `π_D(c) = 1` when `p` is odd. For the
real noncommutative package use coefficients `𝒜 ⊗ 𝒜ᵒᵖ`, with the bimodule structure
`a · (x ⊗ y°) · b = (axb) ⊗ y°` and first coefficient represented by `π(a₀) b₀°`; the opposite factor
is a commuting coefficient, not a replacement for the two module actions.
*Needs:* §1.6; Tau Ceti `TauCeti.normalizedHochschildChains`; NoncommutativeGeometry N1 Hochschild
cochains with coefficients.

It comes with the following API.
- Compatibility with the Hochschild cochains with coefficients of NoncommutativeGeometry N1:
  evaluation of a cochain on a chain intertwines the two boundaries, and `π_D` is compatible with
  this evaluation.
- Functoriality in algebra maps, sums of cycles, normalization, permutation signs, and the
  comparison of antisymmetric chains with differential forms in the smooth case (§6.6).
- For commutative 𝒜 the antisymmetrization map has range in the cycles and induces the
  exterior-form summand. That every Hochschild homology class has an antisymmetric representative
  is not asserted before smoothness is proved.

**Checks.**
- On the circle with `D = i d/dt` and `u = e^(it)`, `[D, u] = −u`, so `c = −u* ⊗ u` has
  `bc = −(u*u − uu*) = 0` and `π_D(c) = −u*(−u) = 1`: an orientation of the odd triple. For
  `D = −i d/dt` the same chain gives `π_D(c) = −1`; the sign of the orientation cycle follows the
  sign of `D`.
- For commutative 𝒜 and `p = 2`, the antisymmetric chain `a₀ ⊗ (a₁ ⊗ a₂ − a₂ ⊗ a₁)` is a cycle:
  `b` gives `a₀a₁ ⊗ a₂ − a₀ ⊗ a₁a₂ + a₂a₀ ⊗ a₁ − (a₀a₂ ⊗ a₁ − a₀ ⊗ a₂a₁ + a₁a₀ ⊗ a₂) = 0`; without
  commutativity it is not.

### 2.6 The weakly oriented commutative package

The **weakly oriented commutative package** replaces the strong orientation by: `χ = π_D(c)` is a
self-adjoint unitary commuting with 𝒜 with `[D, a] χ = (−1)^(p+1) χ [D, a]` for all `a`; `χ` need not be
a grading for `D`. It keeps strong regularity and the other four conditions and, where metric
recovery is required, the explicit **scalar-square condition** `[D, a]² ∈ π(𝒜)` for self-adjoint `a`
(Ćaćić 2011, Corollary 2.19 and Appendix A). Its spectral parity is separate data: a grading `γ`, when
present, commutes with `π(𝒜)` and anticommutes with `D`, and is required neither to equal `χ` nor to
commute with it. A real structure on a weakly oriented package has KO-dimension of the parity of its
spectral grading (§1.4), independently of `p`. Strong orientation is the subclass with `χD = −Dχ` for
even `p` and `χ = 1` for odd `p`, regarded as the even triple with grading `χ`, respectively the odd
triple; any other grading `γ` of the weak package is forgotten in that comparison. The reduction of
the weak package to the strong one is §7.8; it accommodates Hodge–de Rham data without confusing
exterior parity and volume chirality.
*Needs:* §§1.4, 2.1–2.5.

It comes with the following API.
- Since each `[D, a]` anticommutes with `γ` and `γ` commutes with `π(a₀)`, `γχ = (−1)ᵖ χγ`.
- The strongly oriented package maps to the weakly oriented one (`χ = γ` or `χ = 1`), and a weakly
  oriented package with `χD = −Dχ` (even `p`) or `χ = 1` (odd `p`) maps back.

**Checks.**
- The full Hodge–de Rham triple of the circle, on `Ω⁰ ⊕ Ω¹ ≅ L² ⊕ L²` with `D = d + d*`, has
  `c(dt) = [[0, −1], [1, 0]]` (exterior minus interior multiplication),
  `χ = Γ = −i c(dt) = [[0, i], [−i, 0]]` and exterior parity `γ = diag(1, −1)`: `χ² = 1`, `χ`
  commutes with `[D, a] = a′ c(dt)` as `(−1)^(p+1) = 1` requires, and `γχ = −χγ`. Since `χ ≠ 1`, the
  triple is weakly but not strongly oriented.

### Examples

- The circle triple with `D = i d/dt` is a strongly regular commutative package of dimension `1`,
  strongly oriented by `−u* ⊗ u` once its module isomorphism is scaled as in §2.3.
- The full Hodge–de Rham triple of a closed oriented manifold of odd dimension is weakly oriented
  with `χ = Γ`, spectrally even, and of KO-dimension `0` with complex conjugation.

### Dependencies

Layer 1; NoncommutativeGeometry N4 (logarithmic ideal, Dixmier traces), NoncommutativeGeometry N5
(regularity), NoncommutativeGeometry N1 (Hochschild cochains); Tau Ceti
`TauCeti.normalizedHochschildChains`, `ContinuousLinearMap.singularValue`,
`TauCeti.OperatorIdealFamily.logarithmic`, `TauCeti.OperatorIdealFamily.schatten`; HilbertModules
H1; Mathlib's matrix and star-projection API. §2.3 uses the trace choice of §4.4, whose construction
uses only NoncommutativeGeometry N4 and OperatorIdeals Parts A–B.

## Layer 3: smooth projective modules, functions and spectral measure

This layer supplies the functional analysis and module theory that turn a commutative package into
a bundle over a compact space before any manifold structure exists: metrizable locally convex
spaces and the F-space open mapping and closed graph theorems, the smooth Serre–Swan theorem, the
L² module model of a commutative package, the Fréchet topology and spectral invariance of 𝒜,
nuclearity, and the smooth functional calculus (Connes 2008; Rudin, Theorems 2.11 and 2.15; Swan
1962, Theorem 2; Nestruev, Chapter 11).

### 3.1 Metrizable locally convex spaces

On a real or complex vector space with a topology given by Mathlib's `WithSeminorms` for a countable
separating family `(p_n)` of seminorms, construct the translation-invariant metric
`d(x, y) = Σ_n 2^(−n) min(1, p_n(x − y))`, prove that it induces the topology and the uniformity, and
that the space is complete for it if and only if every sequence that is Cauchy for every `p_n`
converges. Mathlib's `WithSeminorms.firstCountableTopology` and `UniformSpace.metrizableSpace` give
first countability and some compatible metric, not this invariant one or its completeness
criterion. Develop finite products, closed subspaces, complete graph domains and quotients by
closed subspaces, with their seminorm families and topology comparisons. A **Fréchet space** is a
complete space of this kind; the definition agrees with that of AutomorphicSpectralTheory §0.11 for
Hausdorff locally convex complex spaces (Rudin, *Functional Analysis*, Chapter 1).
*Needs:* Mathlib `WithSeminorms`, `WithSeminorms.firstCountableTopology`,
`UniformSpace.metrizableSpace`; AutomorphicSpectralTheory §0.11.

**Checks.**
- The truncation `min(1, ·)` is needed: on `ℝ^ℕ` with `p_n(x) = |x_n|`, `x_n = 4ⁿ` and `y = 0`, the
  series `Σ 2^(−n) |x_n − y_n|` diverges while `d(x, y) ≤ 2`.
- The finitely supported sequences `c₀₀ ⊂ ℝ^ℕ` with the same seminorms are not complete: the
  sequence of partial indicator vectors `(1, …, 1, 0, …)` is Cauchy for every `p_n` and converges in
  `ℝ^ℕ` to `(1, 1, …) ∉ c₀₀`.

### 3.2 The open mapping and closed graph theorems for F-spaces

An **F-space** over `𝕜 = ℝ` or `ℂ` is a Hausdorff topological vector space whose topology comes from
a complete translation-invariant metric; in Lean, a uniform additive group with continuous scalar
multiplication, complete, Hausdorff, with countably generated uniformity. Prove
`isOpenMap_of_surjective`: a continuous surjective linear map between F-spaces over `𝕜` is open
(Rudin, *Functional Analysis*, Theorem 2.11). Deduce that a continuous linear bijection of F-spaces
has a continuous inverse, and prove `continuous_of_isClosed_graph`: a linear map between F-spaces
whose graph is closed is continuous (Rudin, Theorem 2.15). *Route:* Baire category in the target
and successive small lifts in the complete source; Tau Ceti's
`TauCeti.closure_image_mem_nhds_zero_of_tendsto_zero` is the Baire step, applied with the sequence
`1/n` of scalars; the closed graph theorem applies the open mapping theorem to the first projection
of the graph, itself an F-space. No local convexity is used: this is exactly the removal of the
seminorm family from the Fréchet open mapping theorem of LocallyAnalyticDistributions §0.2, which
every locally convex application of this roadmap consumes at the fields `ℝ` and `ℂ` (the
`Λ`-seminorm topology of `H∞`, the `δ`-seminorm and Sobolev comparison of 𝒜 in §3.5, the nuclear
Hilbert scales of §3.6 and the quotients of §3.1). Mathlib's Banach-space closed graph theorem and
its open mapping theorem for σ-compact groups are not used in place of these: a Fréchet space is
σ-compact only in finite dimension.
*Needs:* §3.1; LocallyAnalyticDistributions §0.2; Tau Ceti
`TauCeti.closure_image_mem_nhds_zero_of_tendsto_zero`; Mathlib `Filter.IsCountablyGenerated`,
`IsUniformAddGroup`, `CompleteSpace`, `LinearMap.graph`.

**Checks.**
- The Hausdorff hypothesis on the target cannot be dropped: the identity from `ℝ` to `ℝ` with the
  indiscrete topology is a continuous linear surjection between complete pseudometrizable
  topological vector spaces, and the image of `(0, 1)` is not open.
- Completeness cannot be dropped: on the finitely supported sequences, the identity from the `ℓ¹`
  norm to the supremum norm is a continuous linear bijection whose inverse is unbounded
  (`(1, …, 1, 0, …)/k` has supremum norm `1/k` and `ℓ¹` norm `1`), so it is not open.
- The theorem covers spaces that are not locally convex, such as `ℓ^(1/2)` with the metric
  `d(x, y) = Σ |x_n − y_n|^(1/2)`, to which the Fréchet theorem of LocallyAnalyticDistributions §0.2
  does not apply.

### 3.3 The smooth Serre–Swan theorem

On a compact smooth manifold, with no spectral metric given, prove that finitely generated
projective `C∞(X)`-modules correspond to smooth finite-rank vector bundles, including bundles whose
rank is only locally constant, together with Hermitian forms and module maps (continuous case: Swan
1962, Theorem 2; smooth case: Nestruev, *Smooth Manifolds and Observables*, Chapter 11). Use the
smooth section module of PseudodifferentialOperators P1.0 (the `C∞(M, ℝ)`-module on Mathlib's
`ContMDiffSection`), the bundles of SmoothBundlesConnections B2 and the complete smooth-section
topology of ComplexKahlerGeometry K5a (§5.3). Smooth orthogonal projection matrices arise from finite
smooth frames by a Gram normalization; conversely, construct the image bundle of a smooth
self-adjoint idempotent from local frames on the open sets where minors are invertible (the
continuous image bundle is Tau Ceti's `TauCeti.rangeVectorBundle`). This needs only smooth bundles
and sections, not a Dirac operator or Layer 6.
*Needs:* PseudodifferentialOperators P1.0; SmoothBundlesConnections B2; ComplexKahlerGeometry K5a;
TopologicalKTheory T1; HilbertModules H1; Tau Ceti `TauCeti.rangeVectorBundle`,
`TauCeti.exists_continuous_injective_fin_of_compactSpace`; Mathlib `ContMDiffSection`,
`ContMDiffVectorBundle`, `Module.Projective`, `Module.Finite`.

It comes with the following API.
- Evaluation at points, restriction to open sets, tensor product, conjugate, dual, `Hom` and
  endomorphism modules correspond to the same operations on bundles.
- The section functor is fully faithful, with inverse natural isomorphisms.
- Completing smooth sections to continuous ones is compatible with the continuous bundle category of
  TopologicalKTheory T1 and the Hilbert modules of HilbertModules H1. A `C(X)`-completion alone is not
  the smooth theorem.

**Checks.**
- On `S² ⊂ ℝ³`, the Bott projection `e(x) = ½ (1 + x₁σ₁ + x₂σ₂ + x₃σ₃)` is a smooth self-adjoint
  idempotent of rank one (`(x·σ)² = |x|² = 1`, `tr e = 1`) whose image is the tautological line
  bundle, of first Chern number `±1`; its module of sections over `C∞(S², ℂ)` is projective and not
  free, so a version of the theorem restricted to free modules would miss it. Over the circle no such
  example exists for complex line bundles: the complexified Möbius bundle is trivial.
- On `X = X₁ ⊔ X₂`, the projection equal to `diag(1, 0)` on `X₁` and to `diag(1, 1)` on `X₂` gives a
  bundle of rank `1` on `X₁` and `2` on `X₂`: ranks are locally constant, not constant.

### 3.4 The L² module model of a commutative package

For a commutative package satisfying §§2.1–2.4 use the column convention `f = eᵀ` of §2.3. Before
reconstruction, let `X = Spec A`, let `λ` be the finite positive Riesz measure of the positive
functional `τ_D` (BanachSpaceTheory B5), and let `E = f C(X)ᴺ`, at first a continuous image bundle.
Construct the unitary `H ≃ f L²(X, λ)ᴺ` from the absolute-continuity equation and density; the
transpose preserves the pointwise Hermitian form and its integral, so this unitary extends the
represented left-module comparison of §2.3 (Connes 2008).
*Needs:* §§2.3, 3.3; BanachSpaceTheory B5; VonNeumannAlgebras V2; Tau Ceti
`MeasureTheory.Lp.multiplicationOperator`.

It comes with the following API.
- `A″` is the scalar `L∞(X, λ)` multiplication algebra in this representation; `λ` has support `X`,
  every fibre rank is positive and `λ` is finite, so the hypotheses of VonNeumannAlgebras V2's
  abelian `L∞` comparison hold.
- For rows, the right multiplier `R_B(v) = vB` with `B = eBe` satisfies `R_B ∘ R_C = R_(CB)`, so
  `End_𝒜(𝒜ᴺ e) ≃ (e M_N(𝒜) e)ᵒᵖ`; the transpose identifies this opposite corner with the column corner
  `f M_N(𝒜) f`, by `(CB)ᵀ = BᵀCᵀ` and `(B*)ᵀ = (Bᵀ)*`. Hence `End_𝒜(H∞) ≃ f M_N(𝒜) f`, with bounded
  extension, adjoint and norm estimate on the represented module.
- Its centre is `f𝒜`. With `r = Tr(f) = Tr(e)` and `p_j` the polynomial rank projections (`p₀ = 0`),
  a scalar representative of a column-corner element `T` is `Σ_(j>0) p_j Tr(T)/j`. These assertions
  are proved with the actual projection matrices and faithful action, not by assuming the rank
  constant.
- Evaluation, frames, restriction, `Hom`, tensor, conjugate and dual comparisons are transported
  through this module equivalence; after reconstruction the bundle is `f C∞(X)ᴺ`, and it is the
  bundle used in every later Clifford, connection, Spinᶜ and Spin comparison.
- `D` with its full domain and smooth core, and `γ` and `J` when present, transport through the
  unitary, with the intertwining equations, commutators, adjoints, `δ`-domains and graph norms. No
  self-conjugacy, reality or constant-rank hypothesis is added.

**Checks.**
- In `M₂`, with `B = E₁₂` and `C = E₂₁`, `R_B ∘ R_C = R_(CB) = R_(E₂₂)` while `R_(BC) = R_(E₁₁)`: the
  endomorphism algebra of the row module is the opposite corner, and a comparison without the
  transpose would compose in the wrong order.
- For `X = X₁ ⊔ X₂` with ranks `1` and `2`, the rank projections are `p₁ = 1_(X₁)`, `p₂ = 1_(X₂)`,
  and the scalar representative is `1_(X₁) Tr(T) + 1_(X₂) Tr(T)/2`; dividing by a single constant
  rank would be wrong on one component.

### 3.5 Smooth elements, spectral invariance and the Fréchet topology of 𝒜

Under the commutative strongly regular package, prove that for `T ∈ A″` the following are
equivalent: `T ∈ 𝒜`; `T` and `[D, T]` lie in the domain of every power of `δ`; `T` lies in the
domain of every power of `δ`; `T(H∞) ⊂ H∞` (Connes 2008). *Route:* the centre formula of §3.4 and
binomial domain estimates for powers of `|D|`.
*Needs:* §§1.2–1.3, 2.2, 3.4; BanachAlgebras A1–A3 (spectrum, holomorphic calculus, characters);
Tau Ceti `AlgHom.spectrum_apply_eq`; §3.2.

It comes with the following API.
- 𝒜 is spectrally invariant (inverse-closed) in `A`, characters of 𝒜 are automatically continuous,
  and `Spec 𝒜 = Spec A`.
- 𝒜 is complete for the `δ`-seminorms `a ↦ ‖δᵏ(a)‖, ‖δᵏ([D, a])‖`, by closedness of `δ`, and these
  are equivalent to the Sobolev seminorms `a ↦ (Σ_μ ‖Λˢ a η_μ‖²)^(1/2)` for a finite generating frame
  `(η_μ)` (through §3.2).
- The pairings between endomorphisms and module elements are jointly continuous.
- 𝒜 and `H∞` are separable and nuclear, and the compact spectrum `X` is metrizable, by the
  eigenvalue bound of §2.1 alone; `X` is not assumed to be a manifold in these steps.

**Checks.**
- On the circle, `T(H∞) ⊂ H∞` applied to the constant section `1` gives `T·1 = T ∈ C∞(S¹)`: an
  `L∞` function preserving `H∞` is smooth.
- The trigonometric polynomials form a dense subalgebra of `C(S¹)` that is not spectrally invariant:
  `2 + cos t` is invertible in `C(S¹)` but its inverse is not a trigonometric polynomial. In
  `C∞(S¹)` the inverse is smooth.

### 3.6 Nuclear Fréchet spaces and the nuclearity of `H∞`

Construct the nuclear Fréchet interface on the locally convex spaces of §3.1. Consume
AutomorphicSpectralTheory §0.11's definitions of Fréchet space, nuclear map and nuclear space (the
connecting map from a stronger seminorm completion to each seminorm completion is nuclear, by Banach
factorization), stated there for complex scalars, and use the same definitions over `ℝ`. Nuclear
maps between the Banach seminorm completions are BanachSpaceTheory B4's nuclear operators (quotient
norm of absolutely summable rank-one series), whose carrier is Tau Ceti's `TauCeti.NuclearOperator`;
that theory is not rebuilt. Prove independence of the defining seminorm family, the nuclear-space
consequences for the completed projective tensor product of NoncommutativeGeometry N1, and the
finite-sum, closed-subspace and Hilbert-scale criteria. For the spectral Hilbert scale of `Λ`,
choose powers separated enough that the inclusions are trace class by the dimension bound of §2.1;
this proves nuclearity of `H∞` and of its finite closed subspaces and identifies the nuclear
topology used in §10.6. These nuclearity statements are proved here, not inferred from the word
Fréchet (Trèves, Chapter 51, for the nuclearity of smooth function spaces). NoncommutativeGeometry
N1's completed tensor carrier, universal property and Fréchet completeness are consumed, not
rebuilt.
*Needs:* §§2.1, 3.1, 3.2; AutomorphicSpectralTheory §0.11; BanachSpaceTheory B4; NoncommutativeGeometry
N1; Tau Ceti `TauCeti.NuclearOperator`, `TauCeti.OperatorIdealFamily.traceClass`.

**Checks.**
- On the circle, `Λ⁻²` has eigenvalues `(1 + n²)⁻¹`, summable, so the inclusion of the Sobolev space
  `H^(s+2)` into `H^s` is trace class; `Λ⁻¹`, with eigenvalues `(1 + n²)^(−1/2)`, is not trace class,
  so steps of one derivative are not separated enough in dimension `1`. In dimension `p` a step
  `t > p` suffices.

### 3.7 Smooth joint functional calculus and partitions of unity

For commuting self-adjoint elements `a₁, …, a_k` of 𝒜 and a smooth function `φ` near their joint
spectrum, extend `φ` to a compactly supported smooth function on `ℝᵏ` and define `φ(a)` by integrating
its rapidly decaying Fourier transform against the commuting exponentials `e^(i Σ s_j a_j)` (Connes
2008). Prove that `δᵏ(e^(isa))` grows polynomially in `s`, that the integral converges in every
Fréchet seminorm of §3.5, that the result is independent of the extension, and the evaluation and
chain rules. Construct partitions of unity in 𝒜 subordinate to any finite open cover of `X`, in
particular the coordinate domains of §6.1, using cutoffs, this calculus and spectral invariance.
These precede the identification of 𝒜 with `C∞(X)` in §6.6.
*Needs:* §§3.4–3.5; Mathlib's Fourier transform (the `FourierTransform` instance, `𝓕`) on Schwartz
functions.

**Checks.**
- For `𝒜 = C∞(S¹)` and `a = cos t`, `φ(a) = φ ∘ cos` for smooth `φ`; the calculus does not extend to
  continuous `φ`: `|cos t|` is not smooth.
- On the circle with `D = i d/dt`, `[D, e^(is cos t)]` is multiplication by `s sin t · e^(is cos t)`,
  of norm `|s|`: the commutators of the exponentials grow polynomially in `s`, which is what makes
  the Fourier integral converge in every seminorm.

### Examples

- For the circle triple, the L² model is `L²(S¹, λ)` with `λ = π⁻¹ dt` (the measure of `τ_D` from
  §2.3), `End_𝒜(H∞) = C∞(S¹)`, and `𝒜` is the Fréchet algebra `C∞(S¹)`.
- Over `S²`, the Bott projection of §3.3 is a finiteness datum with `N = 2` whose module is
  projective and not free; its rank is `1` everywhere, so the scalar representative of §3.4 is
  `Tr(T)`.

### Dependencies

Layers 1–2; LocallyAnalyticDistributions §0.2; AutomorphicSpectralTheory §0.11; BanachSpaceTheory
B4–B5; BanachAlgebras A1–A3; NoncommutativeGeometry N1; VonNeumannAlgebras V2; HilbertModules H1;
TopologicalKTheory T1; SmoothBundlesConnections B2; ComplexKahlerGeometry K5a;
PseudodifferentialOperators P1.0; the Tau Ceti and Mathlib declarations named above. §§3.1–3.3 and
§3.6 need nothing of Layers 1–2 beyond the dimension bound used in §3.6.

## Layer 4: Lorentz estimates and spectral multiplicity

This layer builds the operator-ideal input of the reconstruction: the Lorentz ideal `L^(p,1)`,
Voiculescu's quasicentral modulus and his multiplicity formula, the specific Dixmier trace used in
§2.3, and the local Lorentz estimate that bounds multiplicities (Voiculescu 1979, Theorem 4.5;
Connes 2008, §9 and Appendix 2).

### 4.1 The Lorentz ideal `L^(p,1)`

For every real `p ≥ 1` construct the symmetric normed ideal

`L^(p,1) = {T compact : ‖T‖_(p,1) = Σ_(j≥0) (j + 1)^(1/p − 1) μ_j(T) < ∞}`,

with OperatorIdeals' singular values and Ky Fan gauges (Tau Ceti `ContinuousLinearMap.singularValue`,
`ContinuousLinearMap.kyFanGauge`) (Voiculescu 1979; Connes 2008, §9). Prove completeness, density of
finite-rank operators, invariance under adjoints and unitaries, the two-sided estimate
`‖ATB‖_(p,1) ≤ ‖A‖ ‖T‖_(p,1) ‖B‖`, monotonicity (in the singular values, and the inclusions
`L^(p,1) ⊂ L^(p′,1)` for `p ≤ p′`), and that `L^(1,1)` is the trace class, with equal norms.
Prove `‖T‖_(p,1) ≤ C_p rank(T)^(1/p) ‖T‖` for finite rank and
`‖T‖_(p,1) ≤ C_p ‖T‖₁^(1/p) ‖T‖^(1 − 1/p)` for trace class, the case `p = 1` separately. The
singular-value sum estimates are proved directly, without an interpolation theorem.
*Needs:* OperatorIdeals Parts A–B; Tau Ceti `ContinuousLinearMap.singularValue`,
`ContinuousLinearMap.kyFanGauge`, `TauCeti.OperatorIdealFamily`,
`TauCeti.OperatorIdealFamily.traceClass`.

**Checks.**
- The weights `(j + 1)^(1/p − 1)` decrease, so by Abel summation `‖T‖_(p,1)` is a positive combination
  of Ky Fan norms and satisfies the triangle inequality; with increasing weights (`p < 1`) it would
  not.
- For a projection of rank `r`, `‖T‖_(p,1) = Σ_(j=1)^r j^(1/p − 1) ≤ p r^(1/p)`; at `p = 2`, `r = 4`:
  `1 + 0.707 + 0.577 + 0.5 = 2.78 ≤ 4`. At `p = 1` the norm is `r`, the trace norm.

### 4.2 The quasicentral modulus

For a finite tuple `t = (t₁, …, t_p)` of bounded self-adjoint operators, define the quasicentral
modulus `k_(p,1)(t)` as the liminf, along the directed set of finite-rank positive contractions `B`
ordered by `≤` (so `B → Id` in the order filter), of `max_j ‖[B, t_j]‖_(p,1)` (Voiculescu 1979). Prove
unitary invariance, the behaviour under restrictions and reducing direct sums, `k_(p,1)(t) = 0` on a
finite-dimensional space, and estimates from finite-rank cutoffs. Prove that strongly convergent
positive finite-rank contractions `R_n` still give an upper bound, by replacing `R_n` with
`P + (1 − P) R_n (1 − P)` for every fixed finite-rank projection `P`; strong convergence alone does
not make a sequence cofinal.
*Needs:* §4.1.

**Checks.**
- On a finite-dimensional space `B = Id` is admissible and `[Id, t_j] = 0`, so `k_(p,1)(t) = 0`.
- The liminf is taken along the order filter: an infimum over all finite-rank positive contractions
  would be `0` for every tuple (take `B = 0`), whereas the multiplication operator by `x` on
  `L²([0, 1])` has positive modulus by §4.3.

### 4.3 Voiculescu's multiplicity formula

For an integer `p ≥ 1` and a commuting `p`-tuple `t` of self-adjoint operators on a separable Hilbert
space, prove

`k_(p,1)(t)ᵖ = γ_p ∫_(ℝᵖ) m_ac(y) dy`, with a constant `0 < γ_p < ∞`,

where `m_ac` is the multiplicity function of the absolutely continuous part of the joint spectral
measure of `t` (Voiculescu 1979, Theorem 4.5; Connes 2008, §9 states its normalization). The same
ideal norm is used throughout. *Route:* the joint Lebesgue–singular decomposition of the spectral
measure, quasicentral finite-rank constructions for the upper bound and the matching lower bound on
the absolutely continuous multiplicity; include the one-operator trace-class case, the dependence of
the constant on the normalization of the norm, and the case of infinite multiplicity, where both sides
are infinite. This formula is a theorem to prove here, not an assumption supplied by the existence of
a direct integral.
*Needs:* §§4.1–4.2; SelfAdjointSpectralTheory SA-B85 (multiplicity classification of representations
of `C(K)`); VonNeumannAlgebras V4 (direct integrals, V4.0.Fields).

**Checks.**
- For `p = 1` and `t` multiplication by `x` on `L²([0, 1])`, `m_ac = 1` on `[0, 1]` and the formula
  gives `k_(1,1)(t) = γ₁ > 0`, so no trace-class perturbation of `t` is diagonal. For a
  diagonal operator with eigenvalues dense in `[0, 1]` (pure point spectrum), `m_ac = 0` and the
  formula gives modulus `0`, which the diagonal projections confirm through the replacement of §4.2.
- Doubling the multiplicity (`t ⊕ t`) doubles the right side, so `k_(p,1)` scales by `2^(1/p)`.

### 4.4 The logarithmic Cesàro trace

Construct the Dixmier trace used in §2.3 explicitly (Connes 2008, Appendix 2). Choose a positive
normalized generalized limit `Ω` at infinity on bounded continuous functions on `[1, ∞)`, put
`Mf(R) = (log R)⁻¹ ∫₁^R f(u) du/u` for `R > 1`, and apply `Ω ∘ M` to the piecewise-constant
interpolation of the logarithmic Ky Fan means `K_(N+1)(T)/log(N + 2)` (Tau Ceti
`ContinuousLinearMap.kyFanLogMean`). Prove that the resulting functional on bounded sequences agrees
with the ordinary limit on convergent sequences and is dilation invariant, so that it is a Tau Ceti
`TauCeti.GeneralizedLimit` with `TauCeti.GeneralizedLimit.IsDilationInvariant`, to which
`TauCeti.dixmierTrace` and the linear Dixmier trace of NoncommutativeGeometry N4 apply. The heat
comparison uses the corresponding second Cesàro mean after the change of parameter `R = ε^(−p)`;
prove the reparametrization identity with this same `Ω`. No equality for an unrelated generalized
limit is used.
*Needs:* NoncommutativeGeometry N4; Tau Ceti `TauCeti.GeneralizedLimit`,
`TauCeti.GeneralizedLimit.IsDilationInvariant`, `ContinuousLinearMap.kyFanLogMean`,
`TauCeti.dixmierTrace`.

**Checks.**
- On the sequence `s_N = (−1)^N` the functional gives `0` (the log-mean of an oscillating bounded
  sequence tends to `0`); on `s_N = 1` it gives `1`.
- For `T` with `μ_j(T) = 1/(j + 1)` the log Ky Fan means tend to `1`, so the trace is `1`, as Tau
  Ceti's `TauCeti.dixmierTrace_eq_one_of_singularValue_eq` states for every generalized limit.

### 4.5 Spectral cutoffs and the local Lorentz estimate

For `D` satisfying the dimension bound of §2.1, construct finite spectral cutoffs `f(εD)` and prove
`‖[f(εD), a]‖ ≤ C_f ε ‖[D, a]‖` from the Duhamel–Fourier formula. In the L² model of §3.4 of a
commutative package, prove the **local Lorentz estimate**: for compact `K ⊂ X` and self-adjoint
`a₁, …, a_p ∈ 𝒜`,

`k_(p,1)((a_j)|_(1_K H)) ≤ C_p max_j ‖δ(a_j)‖ λ(K)^(1/p)`

(Connes 2008, §9). *Route:* `R_ε = 1_K f(ε|D|) 1_K` with a smooth even square cutoff `f`; control the
symmetrized first-derivative term and the `O(ε)` Lorentz remainder with `δ²(a)`; insert `b ∈ 𝒜` equal
to `1` near `K` and optimize `τ_D(b²)` over such cutoffs.

Prove the localized trace estimate this uses from the logarithmic trace of §4.4: once a positive
lower counting bound holds, the second logarithmic Cesàro generalized limit of
`εᵖ Tr(T f(ε|D|))` equals `p ∫₀^∞ u^(p−1) f(u) du · Tr_ω(T |D|⁻ᵖ)` for `T ≥ 0`, and its ordinary
liminf is at most that quantity (Connes 2008, Theorem 14.9 and Corollary 14.10). Prove the
spectral-cutoff comparison and the scale invariance under the specified logarithmic Cesàro limit; an
ordinary heat limit is not substituted without a Tauberian hypothesis. The finite kernel and the
low-frequency terms are kept; they vanish in the rescaled limits. Layer 6 first obtains the lower
count from the global finite-rank estimate and nonzero Lebesgue spectrum (§6.4), and the localized
trace estimate follows, so there is no cycle between the lower count and the local bound.
*Needs:* §§2.1, 2.3, 3.4, 4.1–4.4; NoncommutativeGeometry N4–N5.

**Checks.**
- On the circle (`p = 1`, `D = i d/dt`, `T = 1`): with `f = 1_[0,1]`, `ε #{n : |n| ≤ 1/ε} → 2`, and the
  right side is `∫₀¹ du · Tr_ω(|D|⁻¹) = 2`; with `f(u) = e^(−u²)`, `ε Σ_n e^(−ε²n²) → √π` and
  `∫₀^∞ e^(−u²) du · 2 = √π`. A formula without the factor `p ∫ u^(p−1) f` would give `2` in both.

### Examples

- On the circle, the multiplication operator by `cos t` on `L²(S¹)` has absolutely continuous
  spectrum `[−1, 1]` with multiplicity `2` (each `y ∈ (−1, 1)` has two preimages), so §4.3 gives
  `k_(1,1) = γ₁ · 2 · 2 = 4γ₁`.

### Dependencies

OperatorIdeals Parts A–B; NoncommutativeGeometry N4–N5; SelfAdjointSpectralTheory SA-B85;
VonNeumannAlgebras V4; Tau Ceti's singular values, Ky Fan gauges, trace class, generalized limits and
Dixmier trace. §§4.1–4.4 use nothing of this roadmap; §4.5 uses §§2.1, 2.3 and 3.4, and is applied in
§6.4 only after Layers 5 and 6 have produced Lebesgue spectrum and the lower count.

## Layer 5: integrating spectral derivations before smooth charts

This layer produces, on the compact space `X = Spec A` of a commutative strongly regular package,
the flows that later serve as coordinate motions, before any manifold structure exists: spectral
derivations, their maximum principle and dissipativity, and their integration to one-parameter groups
of automorphisms of 𝒜 that move `λ` within its measure class (Connes 2008). Throughout, the package is
commutative and satisfies §§2.1–2.4 with endomorphism regularity, and the notation is that of §3.4.

### 5.1 Spectral derivations

For `ξ ∈ H∞` define `d_ξ(a) = i h(ξ, [D, a] ξ)`, with `h` the 𝒜-valued form of §2.3. Prove that each
`d_ξ` is a continuous real star derivation of 𝒜 (Fréchet topology of §3.5), and that every `[D, a]`
is a finite sum `Σ_j d_(ξ_j)(a) γ_j` with fixed `ξ_j ∈ H∞` and fixed bounded module endomorphisms
`γ_j`, using a projective frame and polarization (Connes 2008). These scalar derivations are not yet
vector fields on a manifold.
*Needs:* §§2.3–2.4, 3.4–3.5.

**Checks.**
- `d_ξ(ab) = a d_ξ(b) + b d_ξ(a)` uses order one: `[D, ab] = a[D, b] + [D, a]b` and `[D, a]` commutes
  with `b`; and `d_ξ(a)* = d_ξ(a)` for self-adjoint `a` uses `[D, a]* = −[D, a]` and
  `h(ξ, η)* = h(η, ξ)`.
- On the circle with `D = i d/dt` and the frame of §2.3 (`h(ξ, η) = π η ξ̄`), `ξ = 1` gives
  `d_1(a) = i · π · i a′ = −π a′`: a constant vector field.

### 5.2 The maximum principle and dissipativity

Prove the **maximum principle**: for self-adjoint `h ∈ 𝒜`, `[D, h]` vanishes on the fibre over every
point where `h` attains its maximum or its minimum (Connes 2008). Use the limit
`τ⁻¹ e^(iτh) |D| e^(−iτh) ξ → |[D, h]| ξ` as `τ → ∞`, for `ξ ∈ Dom D`; it depends on regularity, and is
proved from the integral resolvent expression for the absolute value of `τ⁻¹D − i[D, h]`,
domain-invariant commutator bounds and a dominated resolvent estimate. Bounded commutators without
regularity do not suffice. The Cesàro means of conjugation are positive contractions and
𝒜-bimodular; applied to states localized near a maximum they give the vanishing on the fibre. Deduce
that `±d_ξ` are dissipative for the C*-norm, hence closable on `C(X)`.
*Needs:* §§1.3, 2.2, 5.1; NoncommutativeGeometry N5 (`|D|` and its resolvent calculus).

**Checks.**
- On the circle, `[i d/dt, h] = i h′` and `|[D, h]| = |h′|`, which vanishes at every maximum and minimum
  of `h`; `τ⁻¹ e^(iτh) D e^(−iτh) = τ⁻¹ D + h′`, whose absolute value tends to `|h′|`.

### 5.3 Compressions and integration to flows

Use strong regularity to prove that `B* D B` on `Dom D` is essentially self-adjoint for every bounded
`δ`-smooth `B` (which preserves `Dom D`), including the rank-one module endomorphisms
`θ_(ξ,η)(ζ) = h(η, ζ) ξ`. Give the adjoint, domain and resolvent-regularization proof: an arbitrary
bounded compression of `D` is not self-adjoint on `Dom D` (Connes 2008). For localized `ξ`, choose
`η ∈ H∞` with `h(η, η) = 1` near the support of `ξ`; compress `D` with `θ_(ξ,η)` and compare its
closure, minus an explicit bounded endomorphism, with `−i d_ξ` on the vectors `aη`. Prove resolvent
solvability on each Sobolev graph space by conjugation with `(D² + λ)ᴺ`, keeping the first
commutator error and the compact higher errors. The Sobolev-to-C* estimates of §3.5 give dense range
of `1 ± ε d_ξ`, and the dissipative estimate of §5.2 closes it. Apply Tau Ceti's Lumer–Phillips
theorem (`TauCeti.Semigroups.IsMDissipative.exists_contractionSemigroup_generator_eq`) or Hille–Yosida
theorem (`TauCeti.Semigroups.hilleYosida_generation_iff`) on the real Banach space underlying `C(X)` to
the closures of `±d_ξ`, and glue positive and negative times with the uniqueness of the generated
semigroup into a strongly continuous isometric group `σ_t`.
*Needs:* §§2.2, 3.4–3.5, 5.1–5.2; OneParameterSemigroups Part A; Tau Ceti
`TauCeti.Semigroups.IsMDissipative.exists_contractionSemigroup_generator_eq`,
`TauCeti.Semigroups.exists_contractionSemigroup_generator_eq_iff`,
`TauCeti.Semigroups.hilleYosida_generation_iff`, `LinearPMap.resolvent`.

**Checks.**
- For `B` the orthogonal projection onto the line of a vector `v ∉ Dom D`, `B` does not map `Dom D`
  into `Dom D`, and the natural domain `{ξ : Bξ ∈ Dom D}` of `B*DB` is `v^⊥`, closed and not dense:
  the `δ`-smoothness of `B` is what the theorem uses.

### 5.4 The flows are automorphisms of 𝒜

Prove that `σ_t` preserves products, adjoints and the unit, by smoothing with analytic elements and
the product rule of the closed derivation (Connes 2008). Prove that `σ_t` preserves 𝒜, with bounds
`‖σ_t(a)‖_s ≤ C_s e^(c_s|t|) ‖a‖_s` in the Fréchet seminorms of §3.5, differentiability in each
seminorm, and joint continuity in `(t, a)`. Remove the restriction to localized `ξ` by finite
projective frames, cutoffs and finite sums; not every Fréchet derivation is assumed to integrate.
Finally prove that `λ` is locally strongly equivalent to its transforms under these flows: the
bounded non-self-adjoint correction in the compressed evolution gives a positive continuous
Radon–Nikodym density, uniformly for `t` near `0`. `λ` is not assumed invariant, nor to be a Haar
measure.
*Needs:* §§3.5, 3.7, 5.3.

**Checks.**
- On the closed interval, `a ↦ a′` is a derivation of `C∞([0, 1])` that integrates to no flow of
  automorphisms (translations leave `[0, 1]`): integrability is a theorem about the spectral
  derivations, not a property of all derivations.
- On the circle with `λ = (2 + cos t) dt` and the rotation flow, the transformed measure has density
  `(2 + cos(t − s))/(2 + cos t)` with respect to `λ`: positive and continuous, and not `1`, so `λ` is
  quasi-invariant without being invariant.

### Examples

- On the circle, `d_1 = −π d/dt` integrates to the rotations `σ_t(a)(x) = a(x − πt)`, which preserve
  `C∞(S¹)` with `‖σ_t(a)‖_s = ‖a‖_s`.

### Dependencies

Layers 2–3; NoncommutativeGeometry N5; OneParameterSemigroups Part A, through Tau Ceti's
Hille–Yosida and Lumer–Phillips theorems. Nothing of Layers 6–11 is used: these flows are built before
any vector field on a reconstructed manifold.

## Layer 6: compact commutative smooth reconstruction

This layer proves Connes' reconstruction theorem (§6.7) and its converse (§6.8). Throughout, the
triple is a strongly regular commutative package of dimension `p ≥ 1` (Layer 2) with an
antisymmetric orientation `p`-cycle `c`, in its strongly oriented form; `X = Spec A`, `λ`, `E` and the
rank projections are those of §3.4, and the flows are those of Layer 5 (Connes 2008, §§2–10 and
11.3–11.4). §§6.1–6.6 are the six components of the proof, with all measures and multiplicities
specified.

### 6.1 Coordinates from the orientation cycle

Write the orientation chain as `c = Σ_α a_α⁰ ⊗ Alt(a_α¹ ⊗ ⋯ ⊗ a_αᵖ)` with self-adjoint coordinate
entries `a_αʲ` for `j > 0`, where `Alt` is the unnormalized alternating sum, and put
`A_α = Σ_σ sign(σ) [D, a_α^σ(1)] ⋯ [D, a_α^σ(p)]`. Put `Ω = γ` in even parity and `Ω = 1` in odd
parity, and `m = p(p + 1)/2`. Construct the normalized fibre expectation
`E_𝒜(T) = Σ_(j>0) p_j Tr(T)/j` on `End_𝒜(H∞) ≃ f M_N(𝒜) f` from the rank projections of §3.4;
fibrewise it is `r(x)⁻¹ tr_(E_x)(T_x)`, with `r` the positive locally constant rank. Prove that it is
𝒜-linear and star-compatible. Define `ρ_α = i^m E_𝒜(Ω A_α) ∈ 𝒜` and prove that it is self-adjoint,
using `A_α* = (−1)^m A_α`, the grading signs and `Ω* = Ω`; the orientation `Σ_α a_α⁰ A_α = Ω` gives
`i^(−m) Σ_α a_α⁰ ρ_α = 1`. Hence the open sets `U_α = {x : ρ_α(x) ≠ 0}` cover `X`, and each splits into
the parts where `ρ_α > 0` and `ρ_α < 0`. On `U_α` the entries define `s_α = (a_α¹, …, a_αᵖ) : X → ℝᵖ`.

Apply the same weighted expectation `E_𝒜(Ω ·)` and the phase `i^m` to the determinant expansion that
the finite expression of `[D, a]` through spectral derivations (§5.1) gives for `A_α`: a nonzero
`ρ_α(x)` forces one coefficient times the determinant of the evaluations of some `p` of those
derivations on the `a_αʲ` to be nonzero. Select that `p`-tuple of derivations locally and shrink the
open set so that the determinant stays nonzero. Composing their flows (§5.4) and applying the
finite-dimensional inverse function theorem proves that `s_α` is open on it, with local transverse
flow maps depending on parameters; this does not yet make `s_α` injective (Connes 2008).
*Needs:* §§2.5, 3.4, 5.1, 5.4; Mathlib's inverse function theorem
(`HasStrictFDerivAt.toOpenPartialHomeomorph`).

**Checks.**
- `A_α* = (−1)^m A_α`: each `[D, a]` with `a` self-adjoint is skew-adjoint, reversing a product of `p`
  factors costs `(−1)^(p(p−1)/2)`, and `(−1)^p (−1)^(p(p−1)/2) = (−1)^(p(p+1)/2)`. For `p = 1`,
  `A = [D, a]` is skew-adjoint and `ρ = i E_𝒜([D, a])` is self-adjoint; without the phase `i^m` it
  would be skew.
- On the circle with `D = i d/dt`, the cycle `c = −u* ⊗ u` is `(−u*) ⊗ cos t + (−iu*) ⊗ sin t`, with
  `A₁ = [D, cos t] = −i sin t` and `A₂ = [D, sin t] = i cos t`, so `ρ₁ = sin t` and `ρ₂ = −cos t`, and
  `−i((−u*) sin t + (−iu*)(−cos t)) = u*u = 1`. The charts `{sin t ≠ 0}` and `{cos t ≠ 0}` cover the
  circle, and `s₁ = cos t` is a local coordinate exactly where `ρ₁ ≠ 0`.

### 6.2 Local measure classes

Smear `λ` by the local flows of §6.1 and use the measure-class bounds of §5.4 to prove: for each open
`V` with compact closure inside a coordinate domain, `(s_α)_*(λ|V)` is equivalent to Lebesgue
measure on `s_α(V)`, and the pushforward of `λ` restricted to the closure of `V` is at most `C` times
Lebesgue measure. Keep uniform Jacobian bounds on shrunken flow boxes and the positivity coming from
full support. Equivalence is not inferred from full support alone (Connes 2008).
*Needs:* §§5.4, 6.1.

**Checks.**
- A full-support measure on `[0, 1]` need not be equivalent to Lebesgue measure: Lebesgue measure plus
  a point mass at each rational with summable weights has full support and is not absolutely
  continuous. The flow argument is what excludes such singular parts.

### 6.3 Fibre counts and multiplicity

Use the multiplicity classification of SelfAdjointSpectralTheory SA-B85, built on the direct integrals
of VonNeumannAlgebras V4, with the local measure classes of §6.2. For the commuting tuple `s_α`
restricted to `1_V H`, with absolutely continuous multiplicity function `m_ac^V`, prove
`#(s_α⁻¹(y) ∩ V) ≤ m_ac^V(y)` for almost every `y`, by taking finitely many disjoint neighbourhoods of
distinct preimages and comparing the resulting copies of the same restricted Lebesgue
representation (Connes 2008). The fibre-count function is lower semicontinuous because `s_α` is open.
Sheets carrying mutually singular measures would not give this inequality.
*Needs:* §6.2; SelfAdjointSpectralTheory SA-B85; VonNeumannAlgebras V4.

**Checks.**
- For `s = cos` on the circle with `V` the whole circle, each `y ∈ (−1, 1)` has two preimages and
  `m_ac(y) = 2` for the multiplication operator on `L²(S¹)`; the inequality is an equality here.

### 6.4 Bounded multiplicity and the lower count

The global cutoff estimate of §4.5 and the multiplicity formula of §4.3 show
`liminf_(R→∞) R^(−p) N_D(R) > 0`. Then apply the localized bound of §4.5 to
`K = s_α⁻¹(E) ∩ closure(V)` for compact `E ⊂ s_α(V)`: with the domination of §6.2 it gives
`∫_E m_ac^V ≤ C vol(E)`, hence `m_ac^V ≤ C` almost everywhere, and lower semicontinuity of the fibre
count (§6.3) upgrades this to a uniform finite bound on `#(s_α⁻¹(y) ∩ V)` for every `y` (Connes 2008).
*Needs:* §§4.3, 4.5, 6.2–6.3.

**Checks.**
- On the circle, `N_D(R) = 2⌊R⌋ + 1`, so `R⁻¹ N_D(R) → 2 > 0`: the lower count holds at `p = 1` and
  fails at every `p > 1` (`R^(−p) N_D(R) → 0`), which pins the dimension.

### 6.5 Local homeomorphisms

Prove that a finite open map with locally bounded finite fibres has a dense open set on which its
local sheets are homeomorphisms, by stratifying by the maximal local fibre number and inducting on it.
Use the transverse flows to move a good point to any point of `X`, transporting its coordinate
functions by an automorphism of 𝒜; this gives local homeomorphisms everywhere (Connes 2008). The map
given by all entries of `c` need not be injective globally, and the local result is proved without
that inference.
*Needs:* §§5.4, 6.1, 6.4.

**Checks.**
- `z ↦ z²` on the unit circle is open with fibres of size `2` and is a local homeomorphism but not
  injective: local charts are all that the argument produces.

### 6.6 The smooth structure and the orientation

The smooth functional calculus of §3.7 shows that smooth functions supported in a chart are elements
of 𝒜; evaluation along the smooth flows proves the reverse local inclusion. Prove that the charts are
smoothly compatible, glue with the partitions of unity of §3.7, and obtain 𝒜 = all smooth functions,
with the usual Fréchet topology. The orientation chain gives a nowhere-vanishing top exterior power,
hence an orientation (Connes 2008).
*Needs:* §§3.7, 6.5; Mathlib `ContMDiffMap`, `IsManifold`.

### 6.7 The reconstruction theorem

Prove that there is an oriented compact smooth `p`-manifold `X` without boundary and an isomorphism
of Fréchet star algebras `𝒜 ≃ C∞(X, ℂ)` extending the Gelfand isomorphism `A ≃ C(X)`; the manifold is
unique up to the unique diffeomorphism inducing that algebra isomorphism. Prove that a unitary
equivalence of spectral triples (§1.1) induces such a diffeomorphism. The orientation cycle is not
asserted unique; the orientation it induces is kept (Connes 2008, §§11.3–11.4).
*Needs:* §§6.1–6.6.

**Checks.**
- The circle triple reconstructs the circle with its smooth structure. Replacing `D` by `−D` keeps
  the manifold; in odd dimension it changes `π_D(c)` to `−π_D(c)`, so `−c` orients the new triple and
  the induced orientation is reversed, while in even dimension `π_(−D)(c) = π_D(c)` and the
  orientation is unchanged.

### 6.8 The converse: the signature triple of a closed oriented manifold

For every closed oriented smooth manifold `X` of dimension `p ≥ 1`, choose a Riemannian metric, the
Hermitian exterior-form bundle and `D = d + d*`, and use `Γ` (§1.7) as grading for even `p` and the
summand `Γ = +1` for odd `p`. This is the **signature construction** (volume chirality), not the
exterior-parity orientation; that every closed oriented manifold arises in this way is the converse
half of the characterization (Connes 2008). Construct the antisymmetric volume cycle from local
coordinates and partitions of unity, with the factor `i^(−p(p+1)/2)/p!` in the negative Clifford
convention, and verify smooth projectivity, absolute continuity with its correctly scaled Hermitian
form (§7.6), dimension, and regularity of every smooth bundle endomorphism by the `D²`-test of §1.3.
Zero-dimensional compact manifolds are §11.3, not this construction with `p = 0`.
*Needs:* SpinGeometry G2, G3.4 and G6.4 (chirality, exterior connection, exterior Dirac operator);
PseudodifferentialOperators P6 (ellipticity); the geometric part of §7.6 (leading trace), which uses
no part of this layer; §§1.3, 1.7, 3.3.

**Checks.**
- The factor `i^(−m)/p!` (`m = p(p+1)/2`): at a point with orthonormal coordinates,
  `π_D(Alt(x¹ ⊗ ⋯ ⊗ xᵖ))` is `p! c(dx¹) ⋯ c(dxᵖ) = p! i^m Γ`, so the cycle with coefficient
  `i^(−m)/p!` represents `Γ`.
- On the circle, `D(f, g) = (−g′, f′)` on `Ω⁰ ⊕ Ω¹`, `Γ = [[0, i], [−i, 0]]`, and the summand `Γ = +1`
  is `{(ig, g)}`, on which `D(ig, g) = (−g′, ig′) = i (ig′, g′)`: the signature triple of the circle is
  the circle triple with `D = i d/dt` of Layer 11.

### Examples

- The circle triple (Layer 11) satisfies every hypothesis with `p = 1` and the cycle `−u* ⊗ u`; §6.7
  returns the circle with its standard orientation.
- The signature triple of the flat torus `ℝ²/2πℤ²` is a strongly oriented package of dimension `2`
  with cycle the volume cycle of §6.8.

### Dependencies

Layers 2–5; SelfAdjointSpectralTheory SA-B85; VonNeumannAlgebras V4; for §6.8, SpinGeometry G2, G3.4,
G6.4, PseudodifferentialOperators P6 and §7.6, whose leading-trace result is proved for geometric
operators independently of this layer (§7.6 depends only on Layers 1–4 and the geometric suppliers),
so the converse creates no cycle.

## Layer 7: recovering bundle, operator, metric and volume

Under the hypotheses of Layer 6, this layer recovers the rest of the geometry: the Hermitian bundle
and the first-order operator, the Riemannian metric (scalar-symbol lemma), the smoothness of the
spectral measure, the Clifford-connection form of `D`, the Weyl law and the Dixmier-trace
normalization, the geodesic distance, and the weakly oriented and real variants (Connes 2008;
Ćaćić 2012; Ćaćić 2011). The geometric statements of §7.6 about an operator given on a manifold do
not depend on Layer 6.

### 7.1 The bundle and the first-order operator

Under the hypotheses of §6.7, §3.4 realizes `H∞` as the smooth sections of a Hermitian bundle `E` over
`X` with nonzero fibres, and absolute continuity realizes `H` as `L²(E, λ)`. By order one, `[D, a]` is
a smooth bundle endomorphism. Construct the induced action of cotangent vectors through
PseudodifferentialOperators P1.0's identification `I_x/I_x² ≃ T*_x X`, proving that `[D, a]` at `x`
depends only on `da_x`, smoothness, locality, and that `D` is a first-order differential operator on
the actual section module (Connes 2008). At this stage `D` is a first-order operator with smooth
coefficients, symmetric in `L²(E, λ)`, with `λ` only a full-support Radon measure; the metric (§7.2)
and the smooth density (§7.3) are derived before PseudodifferentialOperators' geometric `H¹`-domain or
heat results are applied, since symmetry against an arbitrary Radon measure does not supply their
smooth-density hypotheses.
*Needs:* §§2.4, 3.4, 6.7; PseudodifferentialOperators P1.0 (smooth section modules, cotangent ideal
quotients); Mathlib `Ideal.Cotangent`, `Derivation`.

### 7.2 The scalar-symbol lemma and the metric

Prove the **scalar-symbol lemma** for strongly regular packages: the high-frequency limit of §5.2
commutes with every 𝒜-linear endomorphism `T` of `H∞`, because its commutator with `T` is
`τ⁻¹ e^(iτh) [|D|, T] e^(−iτh)`; hence `[D, h]²` is central in `End_𝒜(H∞)` and lies in `π(𝒜)` by the
centre formula of §3.4. Polarization gives a smooth scalar quadratic form on `T*X`,

`g*(df, dg) Id = −½ ([D, f][D, g] + [D, g][D, f])` for real `f, g`,

positive semidefinite by skew-adjointness. The nonzero antisymmetric orientation in each
`p`-dimensional chart makes the cotangent Clifford action injective: a covector in the radical acts
by zero, contradicting the nonvanishing `p`-fold alternating product after completing it to a basis.
Prove this finite-dimensional argument and obtain a smooth positive definite metric `g` (Connes 2008).
Consequently `D` is of Dirac type, with Fourier principal symbol `i c(ξ)` (Convention 8), and `D²` is
of Laplace type. The scalar condition is thus a consequence for the strong package and is kept
explicit in the weakly oriented variant (§7.8). Recover `g` uniquely from the commutators, and `E` with
its Clifford action `c` up to unitary bundle equivalence.
*Needs:* §§2.2, 3.4, 5.2, 7.1; PseudodifferentialOperators P1.0 (principal symbols).

**Checks.**
- On the circle with `D = i d/dt`, `−[D, f]² = f′²`, so `g*(dt, dt) = 1`: the circle of length `2π`.
  With `D = 2i d/dt`, `g*(dt, dt) = 4`, so `g = dt²/4` and the circle has length `π`: scaling `D`
  scales distances inversely.
- For `D² = −d²/dt²` in place of `D`, `[D², f]²` is a second-order operator, not a function: the
  lemma needs order one.

### 7.3 Smooth-measure realization

In a coordinate box choose a smooth `h`-orthonormal frame of `E` and write `D = Σ_j c_j(x) ∂_j + B(x)`
on compactly supported smooth sections; the coefficients are smooth by the first-order comparison of
§7.1 and `D(H∞) ⊂ H∞`, with no `L²`-domain theorem needed for this local statement. The adjoint
identity for bounded commutators and the full support of `λ` give `c_j* = −c_j` pointwise. Treat the
chart pushforward of `λ` as an order-zero distribution through integration of compactly supported
smooth tests, its continuity coming from the compact mass bound. Integration by parts, using the
symmetry of `D`, gives the matrix distribution equation

`Σ_j c_j ∂_j λ = C λ`, where `C = B − B* − Σ_j ∂_j c_j`.

With `tr(c_k c_j) = −r g^(kj)`, `r` the locally constant fibre rank, and the inverse matrix `g_jk`,
derive `∂_j λ = b_j λ` with the smooth real functions `b_j = −r⁻¹ Σ_k g_jk Re tr(c_k C)`: `C` is
skew-Hermitian, and the product of two skew-Hermitian matrices has real trace (alternatively the
imaginary coefficient times the real measure vanishes, and full support forces it to vanish
pointwise). Test these equations with arbitrary scalar tests and matrix units rather than dividing a
distribution. Commuting distributional derivatives and their product rule give
`(∂_i b_j − ∂_j b_i) λ = 0`; full support and continuity give `db = 0`. On star-convex coordinate
boxes, Tau Ceti's Poincaré lemma `StarConvex.exists_contDiffOn_forall_extDeriv_eq` writes `b = dF`.
The positive Radon measure `e^(−F) λ` has every distributional partial derivative zero, so by Tau
Ceti's `Distribution.existsUnique_eq_ofFun_const_of_forall_lineDerivOp_eq_zero` (on the connected box,
with Lebesgue measure) it is a constant multiple of Lebesgue measure, a Radon measure being
determined by its integrals against test functions; positivity and full support make the constant
strictly positive. These local densities glue: `λ = f dv_g` with `f` smooth and strictly positive
(Connes 2008). This proves smoothness before, and independently of, any heat coefficient or Weyl law.
*Needs:* §§7.1–7.2; Tau Ceti `StarConvex.exists_contDiffOn_forall_extDeriv_eq`,
`Distribution.existsUnique_eq_ofFun_const_of_forall_lineDerivOp_eq_zero`; Mathlib `TestFunction`,
`Distribution`.

**Checks.**
- On the circle with `D = i d/dt` on `L²(S¹, λ)` for `λ = w(t) dt` with smooth `w > 0`, symmetry of
  `D` forces `w′ = 0`: `⟨Dξ, η⟩ − ⟨ξ, Dη⟩ = −i ∫ (ξ̄ η)′ w dt = i ∫ ξ̄ η w′ dt`. The operator symmetric
  for `w dt` is `i d/dt + (i/2) w′/w`, for which `B − B* = i w′/w`, `c = i`, and the equation gives
  `∂λ = (w′/w) λ`, the derivative of `w dt`.

### 7.4 The geometric `L²` realization and domains

Construct the unitary `U : L²(E, h, λ) → L²(E, h, dv_g)`, `Us = f^(1/2) s`, and prove its action on
the smooth core, on multiplication operators and on `c`. Name the transported operator
`D_g = U D U⁻¹`; its lower-order coefficient changes by the explicit smooth commutator with
`f^(−1/2)`, so `D_g` is a symmetric smooth Dirac-type operator in geometric `L²`. Apply the elliptic
regularity of PseudodifferentialOperators P6 and the Sobolev carriers of ComplexKahlerGeometry K5a to
`D_g`, as SpinGeometry G6.1 does for Dirac operators, to identify the maximal closed domain and its
adjoint domain with `H¹`, show that smooth sections are a core, and compare all powers with the common
smooth domain; transport these domains back through `U` (Connes 2008). Only after this realization are
the constructions of §§7.5–7.6 used.
*Needs:* §§7.2–7.3; PseudodifferentialOperators P6; ComplexKahlerGeometry K5a (§5.4); SpinGeometry
G6.1.

**Checks.**
- `‖Us‖²` in `L²(dv_g)` is `∫ f |s|² dv_g = ∫ |s|² dλ`, and
  `D_g = D + f^(1/2) [D, f^(−1/2)] = D − ½ c(d log f)`: the change of measure changes only the
  zero-order term.

### 7.5 Clifford connections

Construct a compatible Hermitian Clifford connection `∇` on `E` (SmoothBundlesConnections B3,
SpinGeometry G3.3) and show `D_g = c ∘ ∇ + Φ` for a smooth symmetric zero-order endomorphism `Φ` in
geometric `L²` (Connes 2008). `Φ = 0` is not asserted, and an arbitrary recovered `D` is not identified
with a Levi-Civita spin connection. Relative to an arbitrary Clifford connection the decomposition is
not unique: prove the affine change formula, `Φ` changing by `−c ∘ A` when `∇` changes by a
Clifford-compatible one-form `A`. The unique Bochner connection of `D_g²` (PseudodifferentialOperators
P1.0) is not substituted for a Clifford connection of `D_g` without proof. Transport the
decomposition through `U` to the original weighted realization; there, symmetry of `c ∘ ∇` with the
unchanged metric is not asserted before the measure comparison.
*Needs:* §7.4; SmoothBundlesConnections B3; SpinGeometry G3.3.

**Checks.**
- On the circle, `D = i d/dt + φ(t)` with real smooth `φ` is symmetric and of Dirac type with `∇ = d`
  and `Φ = φ`; it has the same metric as `i d/dt`, so the metric does not determine `Φ`.

### 7.6 The Weyl law and the Dixmier-trace normalization

For every symmetric Dirac-type operator `P` in geometric `L²` on a closed `p`-manifold with a
nonzero-fibre bundle `E`, build the leading Weyl law and the noncommutative-integral comparison.
Consume PseudodifferentialOperators P4 (composition and adjoints on bundles), P6 and P7 (§7.1, the
parameter-dependent resolvent calculus and complex powers); construct the local heat parametrix, the
uniform trace-norm remainder and the gluing of trace densities needed for the leading heat
coefficient. Prove, on each component where `E` has constant rank,

`N_|P|(R) ~ (rank E) vol(Bᵖ)/(2π)ᵖ · Vol_g(X) Rᵖ`

(Hörmander 1968 gives the leading term with a remainder for every positive elliptic operator), and
sum the rank-weighted volumes over components. Derive, for a smooth endomorphism `B`,

`Tr_ω(B |P|⁻ᵖ) = [vol(S^(p−1))/(p (2π)ᵖ)] ∫_X tr_E(B(x)) dv_g(x)`,

proving measurability in the sense of NoncommutativeGeometry N4 through the positive weighted
heat–zeta Tauberian bridge (Connes 2008, Appendix 2, Theorem 14.9) and linearity for general `B`. Show
that the finite-rank kernel terms do not contribute. These are leading-symbol results, not the local
index formula or a minimization of the spectral action.

Apply this to `D_g`. Unitary invariance and `U π(a) = π(a) U` transport the scalar trace formula from
`D_g` back to `D`. For scalar `a` this identifies the smooth density of §7.3 as
`f = c_p rank(E_x)` with `c_p = vol(S^(p−1))/(p (2π)ᵖ)`; hence absolute continuity uses
`h_spectral = (c_p rank E)⁻¹ h_geometric` in the standard `L²` realization. Prove the metric and
measure-change unitary and compare all normalizations (Connes 2008).
*Needs:* PseudodifferentialOperators P4, P6, P7 (§7.1); NoncommutativeGeometry N4; §§2.1, 4.4; for the
application to `D`, §§7.3–7.5.

**Checks.**
- Circle of length `2π`, `P = i d/dt`: `N(R) = 2⌊R⌋ + 1 ~ 2R = 1 · 2/(2π) · 2π · R`, and
  `Tr_ω(|P|⁻¹) = (2/(2π)) · 2π = 2` (eigenvalues `1/|n|` twice for each `n ≥ 1`, with Ky Fan sums
  `~ 2 log N`). A normalization with `(2π)⁻ᵖ` missing would give `4π`.
- Flat torus `ℝ²/2πℤ²` with its rank-`2` spinor bundle: `c₂ = 2π/(2 (2π)²) = 1/(4π)` and
  `Tr_ω(|D|⁻²) = c₂ · 2 · (2π)² = 2π`, matching the Weyl count `N(R) ~ 2 · π/(2π)² · 4π² R² = 2π R²`.
  For the torus `ℝ²/ℤ²` of area `1` the same formula gives `1/(2π)`, the value NoncommutativeGeometry
  N7 records at `θ = 0`.
- Two copies of the same operator double the rank and the trace: the formula is rank-weighted, as a
  definition with `tr_E` replaced by the fibre-normalized trace would not be.

### 7.7 Distance, isometries and finite propagation

Transport `[D, M_f] = c(df)` into RiemannianGeometry R7.8 to obtain `‖[D, M_f]‖ = sup |df|`. Since
`[D, M_f]` depends only on the Clifford action, the commutator seminorm of the reconstructed `D` on
real smooth functions is the one of CompactQuantumMetricSpaces §3.6 for the Clifford module of
RiemannianGeometry R7.8; consume §3.6's identification of its point metric with the geodesic distance
on each connected component of `X`, transporting only the reconstructed data into that interface.
Between distinct components the extended spectral distance is `∞`, as is the path distance; this
clause is proved here. Prove that isomorphisms of triples preserve the metric and, after the
normalization of §7.6, the volume densities. Prove finite propagation of `e^(itD)` in the recovered
distance by the commutator and Duhamel cutoff estimate, stated as the vanishing of `M_f e^(itD) M_k`
for `f, k` with supports at distance greater than `|t|`, without assuming a pointwise kernel (Connes
2008).
*Needs:* §§7.2, 7.4, 7.6; RiemannianGeometry R7.8; CompactQuantumMetricSpaces §3.6; Mathlib
`Manifold.riemannianEDist`.

**Checks.**
- On the circle with `D = i d/dt`, `sup{|f(x) − f(y)| : sup|f′| ≤ 1}` is the arc distance, at most `π`;
  `e^(itD) = e^(−t d/dt)` is translation by `t`, so propagation has speed exactly `1`. With
  `D = 2i d/dt` propagation in the standard metric has speed `2`, and speed `1` in the recovered
  metric `dt²/4`.
- On two disjoint circles, the function equal to `0` on one and `s` on the other has `[D, f] = 0` for
  every `s`, so the spectral distance between the circles is `∞`.

### 7.8 The weakly oriented variant and real Clifford modules

Reduce the weakly oriented package (§2.6) to the strongly oriented one (Ćaćić 2011, Corollary 2.19
and Appendix A). For even `p` put `D₀ = (D − χDχ)/2`, `M = (D + χDχ)/2`; for odd `p` put
`D₀ = (D + χDχ)/2`, `M = (D − χDχ)/2` and `D₁ = χD₀`. By order one and strong regularity, `M` is a
bounded smooth module endomorphism and `D₀` is self-adjoint with the same smooth core. Establish the
regular-perturbation estimates with the differential-operator filtration generated by 𝒜, `[D, 𝒜]` and
the smooth endomorphisms, commutation with `D²` raising the order by at most one. Prove that graph
domains, the dimension condition, strong regularity and the Dixmier integral are preserved for these
particular `M`, by resolvent identities and ideal estimates (§7.9). For even `p`, `χ` is now a grading
of `D₀`; for odd `p`, `D₁² = D₀²` and the represented cycle of `D₁` is `1`. Reconstruct with `D₀` or
`D₁` and transport back to `D`. These perturbation conclusions are not claimed for every bounded
self-adjoint `M`.

If the weakly oriented package carries a real structure `J` of KO-dimension `n` with
`J π(a) J⁻¹ = π(a*)` for every `a`, then `J` preserves `H∞` and descends through §3.4 to an antiunitary
bundle map on `E`. Since `M` is 𝒜-linear, `[D, f] = [D₀, f]`, and `JD = ε′DJ` gives
`J [D, f] J⁻¹ = ε′ [D, f]` for real `f`; for even `n` the spectral grading `γ` is a bundle grading
anticommuting with every `[D, f]`. Hence `E` is a real Clifford module of KO-dimension `n` and `D` is
`J`-compatible, for every `n` and independently of `p` (Ćaćić 2012, Proposition 2.16). This is the
target for real commutative triples whose KO-dimension differs from `p`; the Spin conclusion of §8.5
is drawn only in KO-dimension `p` with its irreducibility hypothesis. With the scalar-square condition
of §2.6, recover the Clifford metric of the original `D` by the cotangent computation of §7.2.
*Needs:* §§2.6, 3.4, 6.7, 7.2, 7.9.

**Checks.**
- For the full Hodge–de Rham triple of the circle, `χ = Γ` commutes with `D = c(dt) d/dt`, so `M = 0`,
  `D₀ = D` and `D₁ = ΓD`; `D₁² = D²` and `π_(D₁)(c) = Γ π_D(c) = Γ² = 1`, so `D₁` is strongly oriented,
  and it is `±D` on the eigenspaces `Γ = ±1`.

### 7.9 Fractional powers and the trace comparison

Prove the operator-ideal inequality used in §7.8: if `A` and `B` are positive compact operators,
`0 < α ≤ 1` and `Σ_j μ_j(A − B)^α < ∞`, then `A^α − B^α` is trace class with
`‖A^α − B^α‖₁ ≤ Σ_j μ_j(A − B)^α` (Birman–Koplienko–Solomyak 1975 for the trace norm; Ando 1988 for
every unitarily invariant norm). *Route:* finite-dimensional spectral majorization from the positive
resolvent integral of `t^α`, finite-rank compressions and the singular-value Fatou bound, with the
singular-sum estimates for exponents below one proved without treating them as Banach norms; Mathlib's
operator monotonicity and concavity of `t^α` (`CFC.monotone_rpow`, `CFC.concaveOn_rpow`) supply the
scalar input.

Apply it with `n = ⌈p/2⌉` and `α = p/(2n)`: expanding the difference of resolvent powers for `Λ_M`
and `Λ` on the common core, the Sobolev-bounded `M` and the extra order gained give
`Λ_M^(−2n) − Λ^(−2n)` in the `α` singular-sum class by Hölder estimates with a strict margin in the
exponent, and the inequality makes `Λ_M^(−p) − Λ^(−p)` trace class. Separately compare `|D|⁻ᵖ` with
`Λ⁻ᵖ` by the scalar estimate `t^(−p) − (1 + t²)^(−p/2) = O(t^(−p−2))` away from the finite kernel and
the lower growth `|λ_j| ≥ c (j + 1)^(1/p)` for large `j`, which follows from the dimension bound of
§2.1 (an upper bound on `|λ_j|` would not suffice); the same applies to `D_M`. These give equality of
the Dixmier traces of `|D|⁻ᵖ` and `|D_M|⁻ᵖ` against every bounded operator, keeping every finite-kernel
term.
*Needs:* §§2.1, 4.1, 7.8; OperatorIdeals Parts A–B; Tau Ceti `TauCeti.OperatorIdealFamily.traceClass`,
`TauCeti.dixmierTrace_eq_zero_of_mem_traceClass`; Mathlib `CFC.monotone_rpow`, `CFC.concaveOn_rpow`.

**Checks.**
- For `1 × 1` matrices the inequality is `|a^α − b^α| ≤ |a − b|^α` for `a, b ≥ 0`; at `α = 1/2`,
  `a = 2`, `b = 1`: `0.414 ≤ 1`. It fails for `α = 2` (`4 − 1 = 3 > 1`), so `α ≤ 1` is needed.
- For `p = 3`: `n = 2`, `α = 3/4`; for `p = 1`: `n = 1`, `α = 1/2`. The expansion
  `(1 + t²)^(−p/2) = t^(−p) (1 − (p/2) t^(−2) + ⋯)` gives the leading difference `(p/2) t^(−p−2)`, whose
  sum over eigenvalues `|λ_j| ≥ c(j + 1)^(1/p)` is bounded by `Σ (j + 1)^(−1 − 2/p) < ∞`.

### Examples

- The circle triple: `E` is the trivial line bundle, `g = dt²`, `λ = π⁻¹ dt`, `f = c₁ · 1 = π⁻¹`, and
  the spectral distance is the arc distance.
- The Hodge–de Rham triple of a closed oriented odd-dimensional manifold is reduced by §7.8 with
  `M = 0`: `d + d* = c ∘ ∇` with `c = ε − ι`, and `Γ` is central in the odd Clifford algebra and
  parallel, so it commutes with `D`; then `D₁ = ΓD` is `±D` on the eigenspaces `Γ = ±1`.

### Dependencies

Layers 2–6; PseudodifferentialOperators P1.0, P4, P6, P7; ComplexKahlerGeometry K5a; SpinGeometry
G3.3, G6.1; SmoothBundlesConnections B3; RiemannianGeometry R7.8; CompactQuantumMetricSpaces §3.6;
NoncommutativeGeometry N4; OperatorIdeals Parts A–B; Tau Ceti's Poincaré lemma, constancy of
distributions, trace class and Dixmier trace; Mathlib's operator monotonicity of `t^α`. The geometric
Weyl law and trace formula of §7.6 use only PseudodifferentialOperators, NoncommutativeGeometry N4 and
§§2.1, 4.4, so §6.8 can use them without a cycle.

## Layer 8: spin-c and spin reconstruction

This layer identifies when the reconstructed bundle is a spinor bundle: irreducible Clifford modules
correspond to Spinᶜ structures (Plymen 1986), a compatible charge conjugation reduces them to Spin
structures, and in even dimension minimal multiplicity already forces strong regularity (Connes 2008,
Theorem 11.5; Ćaćić 2012, §§1.1, 2.1–2.4).

### 8.1 The Spinᶜ group and the irreducible spinor action

Consume FourManifolds F4's early Spinᶜ foundation (§4.1), not its four-dimensional Wu and
topological applications: the group `Spinᶜ(p) = (Spin(p) × Circle)/{(1, 1), (−1, −1)}`, which is Tau
Ceti's `CliffordAlgebra.spinCGroup` for `p ≥ 1`, its projection to `SO(p)` and determinant
`[s, z] ↦ z²` (`CliffordAlgebra.spinCGroup.toSpecialOrthogonal`, `CliffordAlgebra.spinCGroup.det`),
its central circle kernel, associated bundles, lifts, line twists and restrictions, with
SpinGeometry's geometric rank-zero convention, under which `Spinᶜ(0) ≃ Circle`. A lift includes its
specified map to the frame bundle and isomorphisms over that map. Add here the irreducible spinor
action `[s, z] ↦ z ρ(s)`, its comparison with F4's associated bundles, compatible connections and
the module-to-lift reconstruction of §8.2, and prove the local frame, cocycle, determinant and
line-twist formulas against that carrier (Plymen 1986). No second Spinᶜ group or torsor is defined;
the Spin-lift theory of SpinGeometry G4 stays its single owner.
*Needs:* FourManifolds F4 (§4.1); SpinGeometry G4 (Spin lifts) and its rank-zero convention; Tau Ceti
`CliffordAlgebra.spinCGroup`, `CliffordAlgebra.spinCGroup.det`,
`CliffordAlgebra.spinCGroup.toSpecialOrthogonal`; Mathlib `spinGroup`, `Circle`.

**Checks.**
- `[s, z] ↦ z ρ(s)` is well defined because `(−1) ρ(−1) = ρ(1)`; `[s, z] ↦ ρ(s)` alone is not, as it
  sends the equal classes `[1, 1]` and `[−1, −1]` to `1` and `−1`.
- In rank zero the geometric `Spin(0) = {±1}` gives `Spinᶜ(0) = ({±1} × Circle)/{±(1, 1)} ≃ Circle`
  through `[s, z] ↦ sz`, under which the determinant `[s, z] ↦ z² = (sz)²` becomes squaring. Tau
  Ceti's carrier needs a nonzero quadratic form, so rank zero goes through F4's convention.

### 8.2 Spinᶜ structures and irreducible Clifford modules

Use as matrix-algebra bundle `C_X` the full complex Clifford bundle in even dimension and its even
subalgebra in odd dimension (equivalently one chosen volume-labelled irreducible factor). Prove the
equivalence between Spinᶜ lifts and irreducible Hermitian `C_X`-module bundles `S` (Plymen 1986,
Theorem 2.11 for even rank and the remark following its proof for odd rank, with Definition 2.2 for the
even-subalgebra convention; Plymen's "spin-structure" of Definition 2.10 is the Spinᶜ structure of this
section), with the frame and transition reconstruction, the scalar-commutant lemma, the rank
`2^⌊p/2⌋`, and the gauge, isomorphism and line-twist correspondences. Use SpinGeometry G1.3's
matrix-module evaluation, not a second algebraic Morita theory. In odd dimension the two full
Clifford factors differ by the choice of orientation (volume element, §1.7); a faithful irreducible
representation of their direct sum is never demanded.
*Needs:* §§1.7, 8.1; SpinGeometry G1.3, G1.4; Tau Ceti `CliffordAlgebra.complexVolume`; Mathlib
`CliffordAlgebra`.

**Checks.**
- The irreducible ranks are `2, 2, 4, 4, 8` in dimensions `2, 3, 4, 5, 6`.
- `ℂl(3) ≅ M₂(ℂ) ⊕ M₂(ℂ)` has no faithful irreducible representation (each irreducible module is
  `ℂ²` and kills one summand), while its even subalgebra `ℂl⁰(3) ≅ M₂(ℂ)` does: the odd convention
  through the even subalgebra is the one that has irreducible faithful modules.

### 8.3 Spinᶜ reconstruction

For a reconstructed strongly regular package (§6.7), an irreducible `C_X`-action on `E` yields a
Spinᶜ structure, with `H = L²(S)` and `D` a Spinᶜ Dirac-type operator plus a symmetric zero-order term
(§7.5). Conversely, for each Spinᶜ structure with a Hermitian Clifford connection and each symmetric
zero-order term preserving the stated parity and orientation axioms, the resulting triple satisfies
the hypotheses of §6.7 (Plymen 1986).
*Needs:* §§6.7, 6.8, 7.2–7.6, 8.2.

**Checks.**
- On the circle, every Hermitian line bundle with `c(dt) = ±i` is an irreducible Clifford module;
  `D = i d/dt + φ` and `i d/dt` give the same Spinᶜ structure and differ by the zero-order term `φ`.

### 8.4 The even minimal-multiplicity theorem

Let `p` be positive and even. Assume ordinary regularity (NoncommutativeGeometry N5), the other
conditions of §§2.1, 2.3–2.5 with an antisymmetric orientation cycle, and that `A″` acts on `H` with
constant multiplicity `2^(p/2)`. Prove that strong regularity follows, so that §6.7 applies (Connes
2008, Theorem 11.5). *Route:* the Clifford anticommutators are central; the fibrewise rank is at least
`2^(p/2)`, and minimal, so there are no additional central blocks; each endomorphism algebra is
generated by Clifford monomials, whose coefficients are recovered smoothly by the normalized fibre
trace; compactness and partitions of unity give strong regularity globally. This is not an
odd-dimensional removal of strong regularity: the Spinᶜ refinement of §8.3 for arbitrary `p` keeps
strong regularity and the explicit irreducible Clifford-module hypothesis.
*Needs:* §§2.1–2.5, 3.4–3.7, 6.1, 8.2; NoncommutativeGeometry N5.

**Checks.**
- For `p = 2` the multiplicity is `2`: the spinor bundle of a surface. Multiplicity `4` (two copies)
  is not minimal, and there the endomorphism algebra `M₄` is not generated by the Clifford monomials
  `1, c₁, c₂, c₁c₂`, which span only a copy of `M₂` tensored with the identity.

### 8.5 Spin structures from charge conjugation

On the irreducible `S` of §8.2, add a smooth antiunitary bundle map `C` with the KO signs of dimension
`p` (§1.5) and `C c(v) = ε′ c(v) C` for real `v`, together with the chirality sign. Prove that the
subgroup of Spinᶜ spinor frames preserving `C` is Spin and reconstruct a Spin lift; conversely
construct `C` from a Spin lift with the real and quaternionic Clifford models of SpinGeometry G1.
Prove the equivalence on actual lifts and intertwiners, not merely an equality of characteristic
classes. Analytically, if a real triple of KO-dimension `p` has `J a J⁻¹ = a*`, then `J` preserves
`H∞` and descends through §3.4 to a smooth fibrewise `C`; its `JD` and bounded-commutator identities
imply the Clifford relation, and Spin is concluded only under the irreducibility (minimal-rank)
hypothesis. Compare the resulting Spin lift with SpinGeometry G4–G5 and its lifted Levi-Civita
connection. Then `D = D_spin + Φ` with `Φ` a symmetric zero-order term compatible with the parity and
`J`; `D_spin` itself corresponds to `Φ = 0`, and no spectral-action variational theorem is used to
force this choice (Ćaćić 2012, §§1.1, 2.1–2.4).
*Needs:* §§1.5, 3.4, 7.5, 7.8, 8.2–8.3; SpinGeometry G1, G4, G5.

**Checks.**
- On the circle with the periodic spin structure, `S` is the trivial line, `c(dt) = i` and `C` is
  complex conjugation: `C c(dt) = −c(dt) C`, the sign `ε′(1) = −1`.
- The Hodge–de Rham real structure of `ℂP²` (complex conjugation on forms, KO-dimension `0`) lives on
  a bundle of rank `16`, not the irreducible rank `4`; no Spin structure follows, and none exists
  (§11.5).

### Examples

- The spinor bundle of a closed Spin manifold with `D_spin` gives the Spin conclusion with `Φ = 0`;
  twisting by a line bundle `L` changes the Spinᶜ structure by `L` and the determinant line by `L²`.

### Dependencies

Layers 1–7; FourManifolds F4 (§4.1) through its early generic Spinᶜ foundation only; SpinGeometry G1,
G1.3, G4, G5; NoncommutativeGeometry N5; Tau Ceti's `CliffordAlgebra.spinCGroup` and
`CliffordAlgebra.complexVolume`.

## Layer 9: fundamental classes and the duality axiom

This layer gives a spectral triple with a real or bimodule structure its fundamental class in
KK-theory, states the Poincaré duality axiom, and proves it for closed Spinᶜ manifolds, with the
real refinement for Spin manifolds. It introduces no new generic KK-theory and no new index theorem.
Neither Layer 6 nor its analytic prerequisites use the duality axiom.

### 9.1 The complex fundamental class

Construct the complex fundamental class from the bounded transform `F_D = D(1 + D²)^(−1/2)` and the
commuting left and right actions `π(a)` and `b°` (§1.6). For a noncommutative package require
explicitly that the algebraic representation of `A ⊗ Aᵒᵖ` be continuous for the spatial (minimal)
C*-tensor norm; nuclearity of `A` is a sufficient condition, proved separately. Commuting
representations alone extend to the maximal tensor product and do not give this. Use OperatorKTheory
K5 (bounded and unbounded Kasparov cycles, §§5.2 and 5.5) and K6 to obtain
`Δ_D ∈ KK_d(A ⊗_min Aᵒᵖ, ℂ)`, `d` the parity of the triple, and prove its invariance under isomorphisms
of triples (§1.1), its invariance under the perturbations allowed by the cycle hypotheses, and its
compatibility with the index pairing of NoncommutativeGeometry N2–N3.
*Needs:* §§1.6, 2.2; NoncommutativeGeometry N5 (bounded transform); OperatorKTheory K5–K6.

**Checks.**
- For the circle triple (`d = 1`), pairing `Δ_D` with the class of the unitary `u = e^(it)` in the
  first variable gives the index of the Toeplitz operator of `u`, which is `±1` with the sign fixed by
  the sign of `D` (OperatorKTheory K6.6).

### 9.2 The Poincaré duality axiom

Define the strong complex **Poincaré duality axiom** as the existence of
`β ∈ KK_(−d)(ℂ, Aᵒᵖ ⊗_min A)` such that both ordered zigzag products of `β` with `Δ_D` are the identity
classes of `A` and `Aᵒᵖ`, with OperatorKTheory K6's graded exterior product, flip and parity-reduction
signs (§§3.4, 5.1, 6.2 of that roadmap). Prove uniqueness of the dual class, the natural duality
isomorphisms in both KK variables, all K-degree cap maps and the pairing consequences. The conclusion
is an isomorphism of integral groups, not a determinant test on `K₀` modulo torsion.
*Needs:* §9.1; OperatorKTheory K3–K6.

**Checks.**
- Two copies of the circle triple (`H = L²(S¹)²`, `D ⊕ D`) satisfy §§2.1–2.5 with the same cycle
  `−u* ⊗ u`, and their fundamental class is `2Δ_D`; cap product with it maps `K₁(C(S¹)) ≅ ℤ` to
  `K¹(C(S¹)) ≅ ℤ` by multiplication by `2`, not an isomorphism, so the duality axiom fails: it is
  independent of the five conditions used in Layer 6.

### 9.3 The geometric dual class of a Spinᶜ manifold

Build the geometric diagonal (Thom) dual class for a closed Spinᶜ manifold, from the spinor Clifford
module (§8.2), a tubular neighbourhood of the diagonal, Bott–Thom classes and IndexTheory's comparison
of analytic and symbol classes (I2), and prove the two zigzag identities by the local Bott calculation
and gluing. The index theorem of IndexTheory I3–I7 is consumed for the numerical characteristic-class
formula, not for the reconstruction of Layer 6.
*Needs:* §§8.2–8.3, 9.1–9.2; IndexTheory I2–I7; OperatorKTheory K3 (Bott periodicity and boundary
maps).

### 9.4 The real Spin fundamental class

Compare the real Spin branch (§8.5) with the real Clifford-linear analytic index of SpinGeometry G6.0,
the real K-theory and Atiyah–Bott–Shapiro classes of TopologicalKTheory T7, and the KO Thom orientation
of GeneralizedCohomology G5.5. Prove the KO-degree-`p` fundamental class and its real-index and
complexification comparisons on compact Spin manifolds, keeping the eightfold degrees and torsion.
This is the geometric real refinement; no real bivariant KK-theory for arbitrary real C*-algebras is
introduced by calling `J` a real structure. General noncommutative packages may carry the complex
duality axiom of §9.2 independently; a list of KO signs alone never proves it (Dąbrowski–Dossena
§§2–5; Ćaćić 2012).
*Needs:* §§8.5, 9.1–9.3; SpinGeometry G6.0; TopologicalKTheory T7; GeneralizedCohomology G5.5.

**Checks.**
- The real index of the circle in `KO₁ ≅ ℤ/2` is the parity of the real dimension of the kernel of
  `d/dt` on real spinors: `1` for the periodic spin structure (the constants) and `0` for the
  antiperiodic one. A comparison through the complexified index, which is `0` in odd dimension, would
  lose it.

### 9.5 Separating examples

Give examples separating the finiteness and orientation conditions, reality, the scalar-symbol
condition and the duality axiom, including multiplicity twists that change the fundamental class.
*Needs:* §§2.1–2.6, 9.1–9.2.

**Checks.**
- The doubled circle triple of §9.2 satisfies finiteness, orientation and reality (with `J` complex
  conjugation on both copies) and fails duality.
- The Hodge–de Rham triple of the circle (§2.6) is real of KO-dimension `0` and weakly but not strongly
  oriented, so reality does not fix the orientation type.

### Examples

- The circle with the periodic spin structure: `Δ_D` restricts to a generator of `K¹(C(S¹)) ≅ ℤ`, the
  duality axiom holds, and the real class is the nonzero element of `KO₁ ≅ ℤ/2`.

### Dependencies

Layers 1–2 for §§9.1–9.2, Layer 8 for §§9.3–9.4; OperatorKTheory K3–K6; IndexTheory I2–I7;
NoncommutativeGeometry N2–N3, N5; SpinGeometry G6.0; TopologicalKTheory T7; GeneralizedCohomology G5.5.

## Layer 10: products, signs and geometric tensor comparisons

This layer builds the product of spectral triples with its real structures, associativity and swap
comparisons, the shuffle product of orientation cycles, the dictionary between the represented
orientation of a product and the intrinsic volume of the product manifold, and the comparison with
products of manifolds (Dąbrowski–Dossena §§2–5; Ćaćić 2012, Theorem 2.18; Loday, §4.2; Trèves,
Chapter 51). Even and odd always refer to spectral parity (§1.4), never to the metric dimension.

### 10.1 The product of spectral triples

For unital spectral triples construct the represented algebraic tensor product algebra and the
closure of the following operator on the algebraic tensor product of the smooth cores:

| parities | H | D before closure | grading |
| --- | --- | --- | --- |
| even/even | H₁⊗₂H₂ | D₁⊗1+γ₁⊗D₂ | γ₁⊗γ₂ |
| even/odd | H₁⊗₂H₂ | D₁⊗1+γ₁⊗D₂ | none |
| odd/even | H₁⊗₂H₂ | D₁⊗γ₂+1⊗D₂ | none |
| odd/odd | H₁⊗₂H₂⊗ℂ² | D₁⊗1⊗σ₁+1⊗D₂⊗σ₂ | 1⊗1⊗σ₃ |

Here `H₁ ⊗₂ H₂` is the completed Hilbert tensor product (VonNeumannAlgebras V2). Prove density of the
tensor core, essential self-adjointness through the finite-dimensional joint eigenblocks, and the
graph-domain criterion with weight `1 + λ_i² + μ_j²`. The square is `D₁² ⊗ 1 + 1 ⊗ D₂²`, and
`ker D = ker D₁ ⊗ ker D₂` (tensored with `ℂ²` in the odd/odd case). Prove compact resolvent, bounded
commutators, regularity through the `D²`-test of §1.3, and the dimension condition at `p + q` from the
two counting upper bounds; exact two-sided Weyl growth requires the lower bounds as well
(Dąbrowski–Dossena §§2–5).
*Needs:* §§1.2–1.4, 2.1; NoncommutativeGeometry N5; VonNeumannAlgebras V2; Mathlib
`TensorProduct.instInnerProductSpace`.

**Checks.**
- In each row `D` anticommutes with the grading and `D²` has no cross term: for even/even
  `D₁γ₁ ⊗ D₂ + γ₁D₁ ⊗ D₂ = 0`, and for odd/odd `σ₁σ₂ + σ₂σ₁ = 0`.
- The ungraded sum `D₁ ⊗ 1 + 1 ⊗ D₂` is not this product: for two circles with `D = i d/dt` its kernel
  contains `e^(imt) ⊗ e^(−ims)` for every `m ∈ ℤ`, so it is infinite-dimensional and the resolvent is
  not compact; the odd/odd product has kernel `ℂ ⊗ ℂ ⊗ ℂ²`, of dimension `2`.

### 10.2 Real products

Give real products with the conventional input KO signs (§1.5). Their branches follow the KO parity,
which for real triples is the spectral parity (§1.4), so the operator table and the formulas below
select the same branch, and the metric dimensions play no role (Ćaćić 2012, Theorem 2.18;
Dąbrowski–Dossena, §4). For even/even choose `J = J₁ ⊗ (J₂ γ₂^b)` with `(−1)^b = ε₁″`; for even/odd,
`J = (J₁ γ₁^a) ⊗ J₂` with `(−1)^a = ε₁″ ε₂′`; for odd/even, `J = J₁ ⊗ (J₂ γ₂^b)` with
`(−1)^b = ε₁′ ε₂″`. For odd/odd use `J = J₁ ⊗ J₂ ⊗ MK`, with `K` entrywise conjugation on `ℂ²` and
`M` chosen by `(ε₁′, ε₂′)`:

| pair | (+,+) | (+,−) | (−,+) | (−,−) |
| --- | --- | --- | --- | --- |
| M | σ₁ | Id | σ₃ | σ₂ |

Prove the squares, the `JD` and `Jγ` relations and the opposite actions, obtaining KO-dimension
`n₁ + n₂ mod 8`. Alternative even real structures (§1.5) are handled by first applying the `Jγ`
conversion and then transporting the output. The conditions behind the table are `Mσ₁M⁻¹ = ε₁′σ₁` and
`M(−σ₂)M⁻¹ = ε₂′σ₂`; they fix the conjugation sign. Prove the first-order condition and naturality for
real and unitary isomorphisms. `J₁ ⊗ J₂` is not used indiscriminately.
*Needs:* §§1.5–1.6, 10.1.

**Checks.**
- Every branch gives KO-dimension `n₁ + n₂`: for instance even/odd with `n₁ = 2` (`ε₁″ = −1`) and
  `n₂ = 1` (`ε₂′ = −1`) has `a = 0`, `J² = ε₁ε₂ = −1 = ε(3)` and `JD = DJ`, the signs of `n = 3`; the
  same computation succeeds for all `64` input pairs against the table of §1.5.
- In the odd/odd branch with `(ε₁′, ε₂′) = (+, +)` (`n₁, n₂ ∈ {3, 7}`), `M = σ₁` gives `J² = ε₁ε₂` and
  `Jγ = −γJ`, the signs of `n₁ + n₂ ∈ {2, 6}`; `M = Id` would give `J(1 ⊗ D₂ ⊗ σ₂) = −(1 ⊗ D₂ ⊗ σ₂)J`
  (as `Kσ₂ = −σ₂K`) and break `JD = DJ`.

### 10.3 Associativity and the graded swap

Construct the associativity and factor-swap comparisons through the ordered graded-Clifford tensor
model: give the auxiliary two-dimensional identifications in the odd branches and the induced phases
on `D`, `γ` and `J`, and verify the pentagon and graded swap equations there; transport through those
identifications. The bare ungraded Hilbert associator or bare flip need not intertwine the displayed
real structures (Dąbrowski–Dossena §§2–5). In the odd/odd swap use the flip of the Hilbert factors
followed by `U = (σ₁ + σ₂)/√2` on `ℂ²`: `U` exchanges `σ₁` and `σ₂` and sends `σ₃` to `−σ₃`, so the
target has the reversed grading and orientation, not the same displayed `σ₃` grading. For the input
sign pairs `(ε₁′, ε₂′) = (+,+), (+,−), (−,+), (−,−)` compute `U M(ε₁′, ε₂′) Ū⁻¹ = ζ M(ε₂′, ε₁′)` with
`ζ = 1, −i, i, −1` respectively: the swapped real structure is `ζ` times the standard swapped `J`. A
scalar rephasing `z` of `U` (`|z| = 1`) changes `ζ` by `z/z̄ = z²`, so the choice `z² = ζ⁻¹` removes it;
record that choice when comparing with the unphased swapped `J`. This sign reversal is the odd×odd
orientation sign, not a grading-preserving symmetry.
*Needs:* §§10.1–10.2.

**Checks.**
- `Uσ₁U⁻¹ = σ₂`, `Uσ₂U⁻¹ = σ₁`, `Uσ₃U⁻¹ = −σ₃`, and `Uσ₂Ū⁻¹ = −σ₂` for `M = σ₂` (`ζ = −1`); the four
  values of `ζ` follow by direct `2 × 2` matrix computation, and the unphased swap is off by them.

### 10.4 The Hochschild shuffle and the orientation of a product

Define the chain-level `(p, q)`-shuffle of Hochschild chains,

`sh((a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_p) ⊗ (b₀ ⊗ b₁ ⊗ ⋯ ⊗ b_q)) = Σ_σ sign(σ) (a₀ ⊗ b₀) ⊗ x_(σ⁻¹(1)) ⊗ ⋯ ⊗ x_(σ⁻¹(p+q))`,

with `x_i = a_i ⊗ 1` for `i ≤ p`, `x_(p+j) = 1 ⊗ b_j`, and `σ` running over the permutations of
`{1, …, p + q}` increasing on `{1, …, p}` and on `{p + 1, …, p + q}`. Prove that it is a chain map,
`b ∘ sh = sh ∘ (b ⊗ 1 + (−1)ᵖ 1 ⊗ b)`, so that the shuffle of two cycles is a cycle, and that on the
antisymmetric chains representing differential forms it induces the wedge product of forms, which is
the exterior product of differential-form cycles of NoncommutativeGeometry N1 (Loday, *Cyclic
Homology*, §4.2). This unnormalized shuffle has `binomial(p + q, p)` terms.

For a `p`-cycle and a `q`-cycle with represented values `χ₁` and `χ₂`, on factors of any spectral
parity, each shuffle term reorders to the unshuffled term with exactly the shuffle sign, because the
commutators of the two factors anticommute in the displayed product. Hence the shuffle represents
`binomial(p + q, p) · w`, with `w = χ₁ γ₁^q ⊗ χ₂` when the first factor is even, `w = χ₁ ⊗ γ₂ᵖ χ₂`
in the odd/even case and `w = χ₁ ⊗ χ₂ ⊗ σ₁ᵖ σ₂^q` in the odd/odd case. Prove `w* = (−1)^(pq) w` and
`w² = (−1)^(pq)` from `γ_i χ_i = (−1)^(p_i) χ_i γ_i`. Divide by the binomial, and additionally by
`i` when `p` and `q` are both odd: the result `V` is a self-adjoint unitary commuting with the
product algebra, with `[D, x] V = (−1)^(p+q+1) V [D, x]` for every represented `x`, so the product
of weakly oriented packages is weakly oriented in dimension `p + q`. For strongly oriented cycles,
the shuffle represents the binomial times `γ₁ ⊗ γ₂` in the even/even case, times `Id` in either
mixed case, and times `iγ` in the odd/odd case; divide by the binomial, and by `i` in the odd/odd
case. Prove these constants from the displayed commutator formulas and Koszul transpositions; the
number of shuffles is not `(p + q)(p + q − 1)/2`. State the effect of normalizing cycles on the
ordered orientation explicitly. Write `c_norm` for this normalized tensor cycle and `V` for its
represented value: `γ` in even total dimension and `Id` in odd total dimension.
*Needs:* §§2.5–2.6, 10.1; NoncommutativeGeometry N1 (exterior product of cycles; Tau Ceti's tensor
product of cycles); Tau Ceti `TauCeti.normalizedHochschildChains`.

**Checks.**
- For `p = q = 1` there are `binomial(2, 1) = 2` shuffles, `(a₁ ⊗ 1, 1 ⊗ b₁)` and `(1 ⊗ b₁, a₁ ⊗ 1)`
  with sign `−1`, while `(p + q)(p + q − 1)/2 = 1`. The two counts agree when `p` or `q` is `2` and
  differ again at `p = 1, q = 3` (`4` against `6`).
- For two odd strongly oriented factors (`χ₁ = χ₂ = 1`), `w = 1 ⊗ 1 ⊗ σ₁σ₂ = i σ₃`, so `V = σ₃ = γ` and
  `w² = −1 = (−1)^(pq)`.

### 10.5 The orientation dictionary

For the geometric comparison distinguish `V` from the intrinsic volume element of the ordered product
orientation. Put `a_n = i^(−n(n+1)/2)`. With each even input grading equal to its intrinsic `Γ` (§1.7)
and each odd input chosen with `Γ = +1`, derive `a_(p+q)/(a_p a_q) = i^(−pq)` and compute the volume
element of the displayed product Clifford action:

| input dimensions | intrinsic Γ for the ordered product orientation |
| --- | --- |
| p even, q even | `γ₁⊗γ₂` |
| p even, q odd | `(−1)^(p/2) Id` |
| p odd, q even | `(−1)^(q/2) Id` |
| p odd, q odd | `(−1)^((pq−1)/2) γ`, with `γ = 1⊗1⊗σ₃` |

Prove this table for all dimensions from the ordered Clifford generators of the products of §10.1
(Dąbrowski–Dossena §§2–5), including `σ₁σ₂ = iσ₃` in the last case; for instance `p = 2, q = 1`
gives `−Id` and `p = 1, q = 3` gives `−γ`. Denote its sign by `κ`, so that `Γ_ordered = κ V`. The
same computation for weakly oriented geometric inputs, with `χ_i` the intrinsic volume of each
factor and arbitrary spectral parities, gives `Γ_ordered = i^(−pq) w`, hence `κ = (−1)^⌊pq/2⌋`
uniformly; the table is its strongly oriented case. For two odd-dimensional full Hodge–de Rham
factors (both spectrally even, of KO-dimension `0`) the product is even of KO-dimension `0`, in the
even metric dimension `p + q`, with `V = −i χ₁γ₁ ⊗ χ₂` and `κ = (−1)^((pq−1)/2)`.

The normalized tensor cycle of the displayed product therefore represents `κ` times the ordered
geometric orientation. Multiplying the cycle by `κ` represents the ordered intrinsic volume, and must
come with the corresponding geometric convention: in even total dimension the ordered geometric
package has grading `κγ` and cycle `κ c_norm`, with the same `D`; in odd total dimension its `Γ = +1`
package uses the Clifford action `κc`, the operator `κD` and the cycle `κ c_norm`, which for `κ = −1` is
the opposite odd Clifford factor. Prove the comparisons of operators, cores and domains, real
structures and symbols for these explicit changes. The displayed product is kept as well: its
geometric realization carries the orientation `κ` times the ordered orientation, with its displayed
`D`, grading and normalized cycle. A reversal of the grading in even parity, or `D ↦ −D` in odd parity,
negates the complex KK cycle; prove these identities and apply them in the ordered comparison with
OperatorKTheory K6. Record the resulting Clifford and Bott orientation dictionary in the Spinᶜ, Spin
and real-index comparisons (Layers 8–9). No unitary intertwiner is asserted between the two odd
Clifford factors or between a cycle and its negative.
*Needs:* §§1.7, 10.1, 10.4; OperatorKTheory K6.

**Checks.**
- With explicit Clifford matrices in the negative convention the table holds for all
  `1 ≤ p, q ≤ 6`; for `p = q = 1`, the generators `c₁ ⊗ σ₁` and `c₂ ⊗ σ₂` with `c₁ = c₂ = i` (the
  `Γ = +1` circle) give `a₂ (iσ₁)(iσ₂) = i^(−3) · (−iσ₃) = σ₃ = γ`, and `κ = +1`; for `p = 2, q = 1`,
  `i^(−2) = −1`.
- `a_(p+q)/(a_p a_q) = i^(−pq)` because `(p+q)(p+q+1)/2 − p(p+1)/2 − q(q+1)/2 = pq`.

### 10.6 Products of manifolds

For geometric triples identify `C∞(X) ⊗̂_π C∞(Y) ≃ C∞(X × Y)` as nuclear Fréchet star algebras
(Trèves, *Topological Vector Spaces, Distributions and Kernels*, Chapter 51), using local smooth tensor
approximation, partitions of unity and the universal property of the completed tensor product of
NoncommutativeGeometry N1. In precompact chart boxes, cut off and extend to a torus, and use the rapid
decay of the joint Fourier coefficients to sum separated-variable tensors in every projective
derivative seminorm. Take injectivity of the extended map `C∞(X) ⊗̂_π C∞(Y) → ℂ^(X×Y)` from
AutomorphicSpectralTheory §0.13's kernel theorem for nuclear LF function spaces, applied with
`E = C∞(X)`, a nuclear Fréchet space and hence a nuclear strict LF space with constant stages, and
`F = C∞(Y)` realized as functions on `Y`, where point evaluations separate points; the image is
exactly the jointly smooth functions, which is proved here. Glue these inverse maps over finite
charts, and establish independence of the cutoffs and completeness, rather than asserting a kernel
theorem from algebraic density alone.

Consume PseudodifferentialOperators P7's (§7.2) unitary comparison of `L²` of an external bundle with
the Hilbert tensor product, its Fubini and density statements and its graph-domain comparison for the
doubled Dirac operator. Prove the smooth projective-section tensor comparison and its compatibility
with that unitary and with the parity and KO products of §§10.1–10.2, principal symbols, the product
metric, connections and the orientation dictionary of §10.5; the comparison with the ordered geometric
orientation uses its stated grading or odd-factor transport, and the displayed product keeps its
separately identified orientation. Verify finiteness, strong regularity, absolute continuity and the
leading trace normalization for these geometric products through Layers 3 and 7, rather than
inferring them for every abstract algebraic product. Compare Spin, Spinᶜ and real products with
Layer 8 and SpinGeometry G2 and G5, and prove compatibility of bounded transforms and fundamental
classes with OperatorKTheory K6's ordered exterior product and its odd/odd convention.
*Needs:* §§3.6, 7.6, 8.2–8.5, 9.1, 10.1–10.5; AutomorphicSpectralTheory §0.13; NoncommutativeGeometry
N1; PseudodifferentialOperators P7 (§7.2); SpinGeometry G2, G5; OperatorKTheory K6.

**Checks.**
- The Hermitian-form normalization of a product is not the product of the factors': for two circles
  `h_spectral = π h_geometric` on each factor (§7.6, `c₁ = 1/π`), whose product would give `π²`, while
  the torus `ℝ²/2πℤ²` with its rank-`2` bundle needs `(c₂ · 2)⁻¹ = 2π`.
- The algebraic tensor product is not `C∞` of the product: `Σ_n 2^(−n) e^(in(t+s))` is smooth on the
  torus, but its matrix of Fourier coefficients is diagonal with nonzero entries, of infinite rank, so
  it is no finite sum of separated functions; it is a limit of such sums in every projective
  seminorm.

### Examples

- The product of two circle triples (odd/odd) is the Dirac triple of the flat torus with the trivial
  spin structure: `D² = −∂_t² − ∂_s²`, kernel of dimension `2`, `γ = σ₃`.
- The product of a closed oriented surface's signature triple (even) with the circle (odd) is a
  three-dimensional odd triple whose orientation is `(−1)^(2/2) = −1` times the ordered product
  orientation (§10.5).

### Dependencies

Layers 1–3 for §§10.1–10.5 (with §2.6 for the weak orientation and OperatorKTheory K6 for the KK
comparison); Layers 7–9 for §10.6; VonNeumannAlgebras V2; NoncommutativeGeometry N1, N5;
AutomorphicSpectralTheory §0.13; PseudodifferentialOperators P7; SpinGeometry G2, G5;
OperatorKTheory K6.

## Layer 11: finite models and acceptance examples

This layer calibrates the constructions on finite models and classical examples: the classical metric
formula, finite-dimensional triples, dimension zero, the circle and tori, signature and Hodge–de Rham
triples, `ℂP²`, spheres and the noncommutative torus. It does not supply the general reconstruction
proof (Ćaćić 2012, Example 2.9 and Proposition 2.24).

### 11.1 The classical metric calibration

For the elementary classical metric calibration consume CompactQuantumMetricSpaces §3.1 (Layer Q3):
its extended Lipschitz constant on every metric space, its exact comparison with Mathlib's
`LipschitzWith`, the additive, scalar, star and Leibniz laws on bounded functions, and the distance
formula over `C_b(X, ℝ)` with the bounded witness `z ↦ min(d(z, x), d(x, y))`, including the empty and
singleton cases; that roadmap is the single owner of this generic result. Compare the real formula
with complex-valued tests through the Lipschitz upper bound and the inclusion of the real witness.
Align it with the Dirac commutator norm and intrinsic path distance of §7.7 and RiemannianGeometry R7.8,
with the actual bounded test-function and domain hypotheses. On compact `X` compare `C_b(X)` with
`C(X)`; on a noncompact `X`, no finite supremum norm is assigned to every continuous function, and the
extended seminorm is not called finite everywhere. This is a terminal comparison of sources: no
state-space compactness or quantum Gromov–Hausdorff theorem is a prerequisite of Layers 3–10.
CompactQuantumMetricSpaces §3.6 owns the point-metric identification for connected manifolds used in
§7.7, and the state-metric (Wasserstein) consequence; those generic metric theorems are not assigned
here again.
*Needs:* CompactQuantumMetricSpaces §§3.1, 3.6; RiemannianGeometry R7.8; §7.7; Mathlib `LipschitzWith`.

**Checks.**
- Complex-valued tests give the same distance: `|f(x) − f(y)| ≤ d(x, y)` for complex `f` with Lipschitz
  constant `1`, and the real witness attains `d(x, y)`.
- On `ℝ` the continuous function `z ↦ z` has infinite supremum norm and Lipschitz constant `1`: the
  formula is over bounded functions, and `C(ℝ)` carries no finite supremum norm.

### 11.2 Finite-dimensional spectral triples

Construct the finite-dimensional spectral core for every faithful unital star representation of a
finite-dimensional C*-algebra on a finite-dimensional `H` and every self-adjoint matrix `D`: the
domain is all of `H`, the resolvent is compact, commutators are bounded, and regularity holds. Give
direct sums, intertwiners, parity, real and opposite structures, finite bimodule decompositions, and
the explicit linear equations for order zero and one, for `J` and for orientation. This is a
finite-dimensional linear-algebra interface, not a claim that every such `D` satisfies the geometric
conditions.
*Needs:* §§1.1–1.6, 2.4–2.5; NoncommutativeGeometry N5.

**Checks.**
- For a finite triple with `H ≠ 0`, `|D|⁻ᵖ` has finite rank, so its Dixmier trace is `0` (Tau Ceti
  `TauCeti.dixmierTrace_eq_zero_of_rank_le`) and absolute continuity (§2.3) fails for every `p ≥ 1`:
  finite triples are handled with the ordinary trace (§11.3).

### 11.3 Dimension zero, the two-point model and matrix algebras

Dimension zero uses the ordinary trace and finite projective modules, not the vanishing Dixmier
trace or a weak-power formula at `p = 0`. For a finite zero-manifold `X` use `𝒜 = ℂ^X`, `H = ℂ^X`,
`D = 0`, coordinatewise complex conjugation as `J` and the pointwise module metric, and recover `X`
from the primitive idempotents of 𝒜. The spectral distance between distinct points is `∞` in this
zero-Dirac model, as is the path distance. Separately compute the complex two-point model `𝒜 = ℂ²`,
`H = ℂ²`, `D = [[0, m], [m̄, 0]]`: its commutator distance is the reciprocal `1/|m|` of the edge
weight; it fails the commutative first-order condition and, for real `m` with complex conjugation as
real structure (KO-dimension `0`, `γ = diag(1, −1)`), where `b° = b`, the real first-order
condition, so it is not a spin-manifold package. For `M_n(ℂ)` use left and right multiplication on
its Hilbert–Schmidt space, `J(x) = x*` and `D = 0` as a real order-one finite example, and identify
its module and finite trace conventions.
*Needs:* §§1.5–1.6, 2.3–2.4, 11.2.

**Checks.**
- Two-point model: `[D, diag(a₁, a₂)] = [[0, m(a₂ − a₁)], [m̄(a₁ − a₂), 0]]` has norm
  `|m| |a₁ − a₂|`, so `sup{|a₁ − a₂| : ‖[D, a]‖ ≤ 1} = 1/|m|`; and `[[D, a], b]` has off-diagonal
  entries `m(a₂ − a₁)(b₂ − b₁)` and `m̄(a₁ − a₂)(b₁ − b₂)`, nonzero in general, so order one fails.
- For `D = 0` on `ℂ^X`, every `a` has `[D, a] = 0`, so the distance between distinct points is `∞`.

### 11.4 The circle and flat tori

On the circle of length `2π` compare the periodic and antiperiodic spin structures: integer and
half-integer spectra, kernels of dimension one and zero, the weak bound at `p = 1` and the constant of
the singular trace. Use `D = i d/dt` and the KO-dimension-`1` sign of complex conjugation, with
`c(dt) = i` in the positive-volume convention; replacing `D` by `−i d/dt` changes that odd orientation
(§1.7). On flat product tori prove the product signs and orientations of Layer 10 and all Spin twists,
reconstruct the flat metric, and compare with the `θ = 0` spectral model of NoncommutativeGeometry N7.
*Needs:* §§1.5, 1.7, 2.1–2.5, 6.7, 7.2, 7.6, 10.1–10.5; NoncommutativeGeometry N7.

**Checks.**
- Periodic: eigenfunctions `e^(int)`, `D e^(int) = −n e^(int)`, spectrum `ℤ`, kernel the constants;
  antiperiodic (`ξ(t + 2π) = −ξ(t)`): eigenfunctions `e^(i(n+½)t)`, spectrum `ℤ + ½`, kernel `0`. Both
  have `Tr_ω(|D|⁻¹) = 2` (the kernel contributes nothing).
- The `n`-torus has `2ⁿ` spin structures (periodic or antiperiodic in each factor); the trivial one has
  a Dirac kernel of dimension `2^⌊n/2⌋`, all others have kernel `0`.

### 11.5 Signature and Hodge–de Rham triples, `ℂP²` and spheres

On every closed oriented manifold use the signature construction of §6.8 and the full Hodge–de Rham
weakly oriented variant of §7.8, and distinguish their volume chirality from exterior parity. The full
Hodge–de Rham package has spectral grading the exterior parity `γ`, orientation operator `χ = Γ` with
`γΓ = (−1)ᵖ Γγ`, and complex conjugation as a real structure of KO-dimension `0` for every `p`. Its
products (§10.2) with finite real triples of KO-dimension `m` over the algebra `ℂ` give real
commutative triples of KO-dimension `m` over the same manifold for every `m mod 8` (Ćaćić 2012,
Proposition 2.24), all reconstructed by the real Clifford-module target of §7.8. Include the oriented
non-Spin manifold `ℂP²`, showing that a real structure on the reducible bundle of forms gives no Spin
conclusion: FourManifolds F4's integral lift of `w₂` (§4.1) supplies its Spinᶜ structure, its odd
intersection form rules out Spin through the Wu identities of FourManifolds §4.2, and §8.2 constructs
the corresponding irreducible Clifford module. On round spheres consume SpinGeometry's
scalar-curvature kernel vanishing (G6.3 and G6.5), and check the geometric spectral conditions and the
distance independently of a closed formula for all eigenvalues.
*Needs:* §§6.8, 7.8, 8.2, 10.2; FourManifolds F4 (§§4.1–4.2); SpinGeometry G6.3, G6.5.

**Checks.**
- On the circle, with `c(dt) = [[0, −1], [1, 0]]` on `Ω⁰ ⊕ Ω¹`: `Γ = −i c(dt) = [[0, i], [−i, 0]]`,
  `γ = diag(1, −1)`, `γΓ = −Γγ`, and complex conjugation has `J² = 1`, `JD = DJ` (`d + d*` is real) and
  `Jγ = γJ`: the KO-dimension-`0` signs `(+1, +1, +1)`, although `p = 1`.
- `ℂP²` has intersection form `(1)`, odd, while a Spin four-manifold has an even form (`w₂ = 0` and the
  Wu identity `x · x ≡ w₂ · x mod 2`); its bundle of forms has rank `16`, the irreducible rank is `4`.

### 11.6 The noncommutative two-torus and almost-commutative products

For the noncommutative two-torus consume NoncommutativeGeometry N6–N7's smooth algebra (Tau Ceti's
`TauCeti.SmoothNoncommutativeTorus` with its trace), Fourier spectral triple, orientation and trace.
Construct and check its real structure, the KO-dimension-`2` signs and the opposite action in the
same Fourier conventions, the finitely generated free smooth core and the normalization of its
Hermitian and Dixmier form, and write down its orientation Hochschild `2`-cycle. Consume
NoncommutativeGeometry's cyclic and index computations. These checks establish the stated analytic,
module, orientation and real-structure interfaces; they do not infer the duality axiom of §9.2.
Irrationality of `θ` is not imposed. Products with finite models (§10.2) give explicit
almost-commutative examples, with the conditions verified case by case; no classification of
almost-commutative fibrations or of quantum manifolds is inferred from them.
*Needs:* §§1.5–1.6, 2.3, 2.5, 10.2; NoncommutativeGeometry N6–N7; Tau Ceti
`TauCeti.SmoothNoncommutativeTorus`.

**Checks.**
- With `D = −i(σ₁δ₁ − σ₂δ₂)`, `δ_j(U_k) = 2πi δ_jk U_k` and `U₂U₁ = e^(2πiθ) U₁U₂`:
  `[D, U₁] = 2πσ₁U₁` and `[D, U₂] = −2πσ₂U₂`, and the chain
  `c = (i/(8π²)) (U₂⁻¹U₁⁻¹ ⊗ U₁ ⊗ U₂ − U₁⁻¹U₂⁻¹ ⊗ U₂ ⊗ U₁)` satisfies `bc = 0` for every `θ` (the
  two surviving terms cancel because `U₁⁻¹U₂⁻¹ ⊗ U₂U₁ = U₂⁻¹U₁⁻¹ ⊗ U₁U₂`) and
  `π_D(c) = (i/(8π²))(−8π² i σ₃) = σ₃ = γ`.
- `Tr_ω(|D|⁻²) = 1/(2π)`, as for the flat torus of area `1` with its rank-`2` spinor bundle (§7.6).

### Examples

- The product (§10.2) of the circle triple with a finite real triple of KO-dimension `m` over the
  algebra `ℂ` is a real commutative triple over the circle of KO-dimension `1 + m`; for `m = 0` and the
  triple `(ℂ, ℂ, 0)` with complex conjugation and `γ = 1`, it is the circle triple itself.
- The product of the noncommutative torus with `(M_n(ℂ), M_n(ℂ), 0, J(x) = x*)` is an
  almost-commutative example over `𝒜_θ ⊗ M_n(ℂ)`.

### Dependencies

Layers 1–10; CompactQuantumMetricSpaces §§3.1, 3.6; RiemannianGeometry R7.8; FourManifolds F4;
SpinGeometry G6.3, G6.5; NoncommutativeGeometry N5–N7; Tau Ceti's Dixmier trace and smooth
noncommutative torus. Nothing in Layers 1–10 depends on this layer.

## Scope and ownership

**This roadmap owns** the geometric structures on spectral triples (Layer 1); the geometric axiom
packages and their forgetful maps (Layer 2); the invariant metric of countable seminorm families, the
open mapping and closed graph theorems for F-spaces, the smooth Serre–Swan theorem, the `L²` module
model of a commutative package, spectral invariance and the Fréchet topology of 𝒜, the nuclear
Fréchet interface over `ℝ` and `ℂ` with the nuclearity of `H∞`, and the smooth functional calculus
(Layer 3); the Lorentz ideal `L^(p,1)`, the quasicentral modulus, Voiculescu's multiplicity formula, the
logarithmic Cesàro trace and the local Lorentz estimate (Layer 4); the integration of spectral
derivations (Layer 5); the reconstruction theorem and its converse (Layer 6); the recovery of bundle,
metric, measure, distance and real Clifford module, the leading Weyl law and Dixmier-trace comparison,
and the fractional-power inequality (Layer 7); the Spinᶜ and Spin reconstruction dictionary and the
even minimal-multiplicity theorem (Layer 8); the fundamental-class and duality interface with its
geometric comparisons (Layer 9); products of spectral triples, their real structures and signs, the
chain-level Hochschild shuffle and the identification `C∞(X) ⊗̂_π C∞(Y) ≃ C∞(X × Y)` (Layer 10); and
the finite models and acceptance examples (Layer 11). Hochschild chains with bimodule coefficients and
their represented chain map are built in §2.5.

**Outside this roadmap.** General noncommutative axiom packages have their stated algebraic, analytic
and index consequences, but no classification of all noncommutative manifolds is asserted. Lorentzian,
boundary and noncompact reconstruction, the Standard Model, and a general theory of quantum Lip-norms
and state-space compactness are outside this roadmap's geometric classification; the last is distinct
from the classical distance theorem consumed in §7.7. No real bivariant KK-theory for arbitrary real
C*-algebras is introduced (§9.4).

**Owned elsewhere and consumed here.**

- *The analytic core* is NoncommutativeGeometry N4–N5: spectral triples, the compact-resolvent
  eigenbasis calculus, bounded commutators, the closed derivation `δ(T) = [|D|, T]`, regularity, the
  logarithmic ideal, dilation-invariant generalized limits and Dixmier traces. No other spectral-triple
  or unbounded-operator carrier is introduced here. Cyclic cohomology, the exterior product of cycles,
  the cochain shuffle comparison, the completed projective tensor product of locally convex spaces
  (N1), the cyclic and index pairings (N2–N3) and the noncommutative torus (N6–N7) are also
  NoncommutativeGeometry's. The normalized Hochschild chains with `b` and `B` are already in Tau Ceti.
- *Singular values, Ky Fan gauges, trace class and ideal estimates*: OperatorIdeals Parts A–B, with the
  carriers already in Tau Ceti; this roadmap owns only the Lorentz specialization `L^(p,1)` and the
  quasicentral modulus (§§4.1–4.2).
- *Spectral multiplicity*: the separable classification of representations of `C(K)` by measure class
  and multiplicity is SelfAdjointSpectralTheory SA-B85, built on the direct integrals of
  VonNeumannAlgebras V4; domains, cores, reduced restrictions, spectral projections and the spectral
  measure of unbounded self-adjoint operators are SelfAdjointSpectralTheory Parts C–E.
- *Operator algebras, states, Hilbert tensor products and direct integrals*: VonNeumannAlgebras V0,
  V2, V4; Hilbert modules and continuous fields: HilbertModules H1–H3, H5.
- *Spectrum and holomorphic calculus* in Banach algebras: BanachAlgebras A1–A3, with Mathlib's
  continuous functional calculus; *Banach projective tensors, nuclear operators and the Riesz
  representation*: BanachSpaceTheory B4–B5, the nuclear operators already in Tau Ceti.
- *Fréchet and nuclear spaces*: the definitions of Fréchet space, nuclear map and nuclear space over
  `ℂ` and the nuclear LF kernel theorem are AutomorphicSpectralTheory §§0.11 and 0.13; this roadmap adds
  the real case, independence of the defining family, the finite-sum, closed-subspace and Hilbert-scale
  criteria, the nuclearity of `H∞` (§3.6) and the identification of the image of the kernel map with
  the jointly smooth functions (§10.6). The open mapping theorem for Fréchet spaces over a complete
  nontrivially normed field is LocallyAnalyticDistributions §0.2; this roadmap owns only its extension
  to F-spaces, without a seminorm family, and the closed graph theorem deduced from it (§3.2), which
  that roadmap does not state.
- *Semigroups*: the Hille–Yosida and Lumer–Phillips theorems (OneParameterSemigroups Part A)
  are already in Tau Ceti; §5.3 proves that the particular compressed derivations satisfy their
  hypotheses.
- *Bundles*: the continuous finite-rank bundle category and complements are TopologicalKTheory T1;
  smooth bundles, `Hom`, duals, metrics, connections and `L²` sections are SmoothBundlesConnections
  B2–B3; this roadmap owns the smooth Serre–Swan comparison needed before a metric is reconstructed
  (§3.3).
- *Elliptic analysis*: the complete smooth-section topology, bundle distributions, the compact-bundle
  Sobolev scale and Laplace-type realizations are ComplexKahlerGeometry K5a (§§5.1, 5.3, 5.4, 5.7);
  smooth section modules, cotangent quotients, differential operators, symbols, Sobolev estimates,
  parametrices, the parameter-dependent resolvent calculus, powers and external-bundle tensor products
  are PseudodifferentialOperators P1.0, P4–P7. This roadmap owns the passage from reconstructed data to
  these operators and the leading Weyl and singular-trace comparisons (§§7.1–7.6).
- *Metrics*: the classical Lipschitz constant and the bounded-witness distance formula are
  CompactQuantumMetricSpaces §3.1, its single owner; the point-metric identification for the Dirac
  commutator seminorm on closed connected Riemannian manifolds and the state-metric consequence are
  CompactQuantumMetricSpaces §3.6; the commutator norm and distance duality are RiemannianGeometry
  R7.8. The reconstruction of Layers 3–6 does not depend on CompactQuantumMetricSpaces.
- *Spin geometry*: Clifford classifiers, chirality, Clifford modules and connections, Spin lifts, spinor
  bundles, Dirac operators and the real analytic index are SpinGeometry G1–G6; the generic Spinᶜ
  foundation is FourManifolds F4 (§4.1), whose group is already in Tau Ceti; no four-dimensional
  classification or Wu theorem is needed for Layer 8, and the `ℂP²` example of §11.5 uses F4's Wu
  identities (§4.2). This roadmap owns the missing Spinᶜ, irreducible-Clifford and charge-conjugation
  reconstruction dictionary.
- *K-theory and index theory*: Bott periodicity, KK-cycles, the Kasparov product and index pairings
  are OperatorKTheory K3–K6; symbol classes, the analytic index and its applications are IndexTheory
  I2–I7; real K-theory is TopologicalKTheory T7 and the KO Thom orientation GeneralizedCohomology G5.5.
  This roadmap owns the fundamental-class and duality interface and its geometric comparison, not a
  generic KK-theory or another index theorem.
- *Calculus on manifolds*: the Poincaré lemma on star-convex sets (recorded in DifferentialGeometry
  6.2) and the constancy of distributions with vanishing derivatives are already in Tau Ceti.

The exact declarations and sections, with what is assumed of each, are in the supplier contracts
below.

## Exact supplier contracts

### From Mathlib

- *Unbounded operators and tensor products*: `LinearPMap` (partial linear maps, with its `adjoint`,
  graphs and domains); `TensorProduct.instInnerProductSpace` (the inner product on an algebraic tensor
  product of inner product spaces, without completion); `CStarModule` (Hilbert C*-modules, a right
  `A`-module written as a `CStarModule` over `Aᵐᵒᵖ`).
- *Locally convex spaces*: `WithSeminorms`, `WithSeminorms.firstCountableTopology` (a countable
  seminorm family gives a first-countable topology), `UniformSpace.metrizableSpace` (a `T₀` uniform
  space with countably generated uniformity is metrizable); `ContinuousLinearMap.isOpenMap` and
  `LinearMap.continuous_of_isClosed_graph` (the Banach-space theorems, not used for F-spaces);
  `AddMonoidHom.isOpenMap_of_sigmaCompact` (open mapping for σ-compact groups, not applicable to
  infinite-dimensional Fréchet spaces).
- *Matrices and projections*: `Matrix.mulVecLin_transpose` (`Mᵀ.mulVecLin = M.vecMulLinear` over a
  commutative ring), `IsStarProjection` with `isStarProjection_iff'` (`p * p = p ∧ star p = p`), and
  `Matrix.star_eq_conjTranspose`.
- *Manifolds and bundles*: `ContMDiffMap`, `ContMDiffSection` (a module over the scalars only),
  `FiberBundleCore`, `VectorBundle`, `ContMDiffVectorBundle`, `IsManifold`,
  `HasStrictFDerivAt.toOpenPartialHomeomorph` (the inverse function theorem),
  `Manifold.riemannianEDist` (the infimum of lengths of `C¹` paths).
- *Algebra*: `CliffordAlgebra`, `spinGroup`, `Circle`, `MultilinearMap`, `Derivation`,
  `Ideal.Cotangent`, `Module.Projective`, `Module.Finite`, `StarAlgEquiv`, `LinearIsometryEquiv`.
- *Functional calculus and analysis*: `cfc`; `CFC.monotone_rpow` and `CFC.concaveOn_rpow` (for
  `0 ≤ p ≤ 1`, `a ↦ a^p` is monotone and concave on the positive part of a C*-algebra); `LipschitzWith`;
  `TestFunction` and `Distribution`; the Fourier transform `𝓕` (`FourierTransform`), with phase
  `e^(−2πi⟨v, w⟩)`.

### From Tau Ceti

All declarations below are proved at the pin; paths are under `TauCeti/`.

- *Resolvents* (`Topology/Algebra/Module/LinearPMap/Resolvent/`): `LinearPMap.resolventSet`,
  `LinearPMap.resolvent` (the continuous inverse of `λ • I − A`, junk off the resolvent set),
  `ContinuousLinearMap.resolvent_toPMap_top` (agreement with Mathlib's resolvent for continuous
  operators), `LinearPMap.HasCompactResolvent` (some resolvent compact) with
  `LinearPMap.hasCompactResolvent_iff_forall_isCompactOperator_resolvent` and
  `LinearPMap.hasCompactResolvent_neg_iff`, `LinearPMap.invOneAddSq` (`(1 + A²)⁻¹ = R(−i) R(i)`).
- *Self-adjoint operators* (`Analysis/InnerProductSpace/LinearPMap/`):
  `IsSelfAdjoint.exists_hilbertBasis_forall_apply_eq_smul_of_hasCompactResolvent` (a self-adjoint
  operator with compact resolvent on a Hilbert space has an orthonormal eigenbasis with real
  eigenvalues in its domain); Stone's theorem
  `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`.
- *Semigroups* (`Analysis/Semigroups/Generation/`): `TauCeti.Semigroups.hilleYosida_generation_iff` (on
  a real Banach space, `A` generates a strongly continuous semigroup with growth bound `(ω, M)` iff
  `1 ≤ M`, `A` is densely defined, `(ω, ∞)` is in its resolvent set and the resolvent powers satisfy
  `‖R(λ)ⁿ‖ ≤ M/(λ − ω)ⁿ`); `TauCeti.Semigroups.exists_contractionSemigroup_generator_eq_iff` and
  `TauCeti.Semigroups.IsMDissipative.exists_contractionSemigroup_generator_eq` (Lumer–Phillips, real
  scalars).
- *Operator ideals* (`Analysis/OperatorIdeal/`): `ContinuousLinearMap.singularValue` (zero-indexed
  approximation numbers), `ContinuousLinearMap.kyFanGauge`, `ContinuousLinearMap.kyFanLogMean`
  (`K_(N+1)(T)/log(N + 2)`), `TauCeti.OperatorIdealFamily`, `TauCeti.OperatorIdealFamily.traceClass`,
  `TauCeti.OperatorIdealFamily.schatten`, `TauCeti.OperatorIdealFamily.logarithmic`;
  `TauCeti.dixmierTrace` (`ω` applied to the logarithmic Ky Fan means, a Dixmier trace of `|T|`,
  subadditive but not proved additive), with `TauCeti.dixmierTrace_eq_zero_of_mem_traceClass`,
  `TauCeti.dixmierTrace_eq_zero_of_rank_le` and `TauCeti.dixmierTrace_eq_one_of_singularValue_eq`.
- *Generalized limits* (`Analysis/Normed/Order/GeneralizedLimit.lean`): `TauCeti.GeneralizedLimit` (a
  positive linear functional on bounded real sequences agreeing with the limit on convergent ones),
  `TauCeti.GeneralizedLimit.IsDilationInvariant`.
- *Nuclear operators* (`Analysis/Normed/Operator/Nuclear.lean`): `TauCeti.NuclearOperator`, the range
  of the completed projective tensor product `E* ⊗̂_π F` in `E →L F`.
- *Hochschild chains and cycles* (`RingTheory/CyclicCohomology/`):
  `TauCeti.normalizedHochschildChains` (the tensor powers modulo degenerate tensors, with `b` and
  `B`); the tensor product of cycles and `TauCeti.exteriorProductCocycle`
  (`NoncommutativeGeometry/UniversalDifferential/ExteriorProduct.lean`).
- *Noncommutative torus* (`NoncommutativeGeometry/SmoothTorus/Basic.lean`):
  `TauCeti.SmoothNoncommutativeTorus` (rapidly decreasing coefficients, twisted product, unitaries `U₁`,
  `U₂` with `U₂U₁ = e^(2πiθ) U₁U₂`, and the faithful trace).
- *Clifford algebra* (`LinearAlgebra/CliffordAlgebra/`): `CliffordAlgebra.complexVolume` (the normalized
  complex volume element `i^⌊(n+1)/2⌋ c(e₁) ⋯ c(e_n)`: SpinGeometry's chirality in even dimension and
  its `ω_Spin` in odd dimension); `CliffordAlgebra.spinCGroup` (the quotient of
  `spinGroup Q × Circle` by `{1, (−1, −1)}`, for a nonzero real quadratic form `Q`) with
  `CliffordAlgebra.spinCGroup.det` and `CliffordAlgebra.spinCGroup.toSpecialOrthogonal`.
- *Analysis on open sets*: `StarConvex.exists_contDiffOn_forall_extDeriv_eq` (a closed `C^r` form,
  `r ≥ 1`, on an open star-convex set is exact; `Analysis/Calculus/DifferentialForm/Poincare.lean`);
  `Distribution.existsUnique_eq_ofFun_const_of_forall_lineDerivOp_eq_zero` (a distribution on a
  connected open set of a finite-dimensional real space with all directional derivatives zero is a
  constant times a Haar measure; `Analysis/Distribution/Constancy/Basic.lean`);
  `MeasureTheory.Lp.multiplicationOperator` (multiplication by an `L∞` function on `L²`).
- *Bundles and open mapping* : `TauCeti.rangeVectorBundle` (the range of a continuous projection
  family is a vector bundle; `Topology/VectorBundle/IdempotentRange.lean`),
  `TauCeti.exists_continuous_injective_fin_of_compactSpace` (an embedding of a bundle over a compact
  base into a trivial bundle); `TauCeti.closure_image_mem_nhds_zero_of_tendsto_zero` (the Baire step of
  the open mapping theorem; `Topology/Algebra/OpenMapping/Basic.lean`); `AlgHom.spectrum_apply_eq`.

### From TauCetiRoadmap.NoncommutativeGeometry

- N1: the completed projective tensor product of locally convex spaces over `ℝ` and `ℂ` with its
  universal property, Fréchet completeness and Banach comparison; Hochschild cochains with
  coefficients; the exterior product of cycles and the cochain shuffle comparison.
- N2–N3: cyclic pairings with K-theory, Fredholm modules and their characters, used for the index
  pairing of §9.1.
- N4: the logarithmic ideal, dilation-invariant generalized limits and the linear Dixmier trace.
- N5: unital spectral triples (a self-adjoint `LinearPMap` with compact resolvent, a representation
  preserving its domain and bounded commutators), the eigenbasis-independent calculus (`|D|`, sign,
  heat operators, inverse powers), the closed derivation `δ`, regularity, graph seminorms, the
  commutator estimates and the bounded transform `D(1 + D²)^(−1/2)`.
- N6–N7: the smooth noncommutative two-torus, its derivations, orientation and trace, its Fourier
  spectral triple `D = −i(σ₁δ₁ − σ₂δ₂)` with `Tr_ω(|D|⁻²) = 1/(2π)`, the `θ = 0` model, and the
  cyclic and index computations.

### From TauCetiRoadmap.OperatorTheory

- OperatorIdeals Parts A–B: approximation numbers and Hilbert-space singular values, Ky Fan gauges, the
  two-sided ideal inequality, symmetric ideals, Schatten norms and the trace class.
- SelfAdjointSpectralTheory SA-B85: cyclic multiplication models and the classification of
  representations of `C(K)` by control measure class and multiplicity function. Parts C–E: domains,
  cores, reduced restrictions, spectral projections, the spectral measure of an unbounded self-adjoint
  operator and Stone compatibility.

### From TauCetiRoadmap.VonNeumannAlgebras

V0 (C*-algebras and states, GNS); V2 (completed Hilbert tensor products of `TensorProduct ℂ H K`, and
`L∞` of a σ-finite measure acting on `L²` as its own commutant); V4 (V4.0.Fields: measurable fields of
separable Hilbert spaces, direct integrals, decomposable operators and change of measure).

### From TauCetiRoadmap.BanachAlgebras

A1–A3: spectrum and resolvent identities, the holomorphic functional calculus and characters, used for
spectral invariance in §3.5.

### From TauCetiRoadmap.BanachSpaceTheory

B4: the projective tensor product of Banach spaces, nuclear operators as the range of
`E* ⊗_π F → (E →L F)` with the quotient norm, and the nuclear–trace-class comparison. B5: the duality
between `C(K)` and finite regular Borel measures for compact `K`.

### From TauCetiRoadmap.AutomorphicSpectralTheory

§0.11: Fréchet spaces, nuclear maps (Banach factorization) and nuclear spaces, for Hausdorff locally
convex complex spaces. §0.13: for a complete nuclear LF function space `E` on `X` and a function space
`F` on `Y` whose completion separates points, the map `e ⊗ f ↦ ((x, y) ↦ e(x) f(y))` extends to a
continuous linear injection `E ⊗̂_π F → ℂ^(X×Y)`.

### From TauCetiRoadmap.LocallyAnalyticDistributions

§0.2: a continuous surjective linear map between Fréchet spaces over a complete nontrivially normed
field is open.

### From OneParameterSemigroups (completed)

[OneParameterSemigroups](../../Completed/OneParameterSemigroups/README.md) Part A: the Hille–Yosida
and Lumer–Phillips theorems, which are Tau Ceti's `TauCeti.Semigroups.hilleYosida_generation_iff`
and `TauCeti.Semigroups.exists_contractionSemigroup_generator_eq_iff`.

### From TauCetiRoadmap.HilbertModules

H1 (pre-Hilbert modules, completions and fibres, the opposite-algebra convention for right modules),
H2 (adjointable maps, finite Parseval frames and the finitely generated projective modules they
characterize), H3 (interior tensor products and induction), H5 (continuous fields of Hilbert
spaces and modules).

### From TauCetiRoadmap.TopologicalKTheory

T1: continuous finite-rank bundles over a paracompact base as a category, with complements over
compact bases. T7: real K-theory, real Bott periodicity and the Atiyah–Bott–Shapiro classes.

### From TauCetiRoadmap.SmoothBundlesConnections

B2: associated bundles, frames, `Hom`, dual, tensor and metric bundles, and the Hilbert space of
square-integrable sections. B3: connections, induced connections and metric-compatible connections.

### From TauCetiRoadmap.ComplexKahlerGeometry

K5a (§§5.1, 5.3, 5.4, 5.7 of its Layer 5): bundle test functions and distributions, the Fréchet
topology of smooth sections, the real-order Sobolev scale of a compact bundle with density and
duality, and the realization of Laplace-type operators. Its density line precedes
PseudodifferentialOperators P1.0, and its analytic scale consumes P1.0.

### From TauCetiRoadmap.PseudodifferentialOperators

P1.0: the `C∞(M, ℝ)`-module of smooth sections on `ContMDiffSection`, the identification of
`I_x/I_x²` with `T*_x M`, differential operators and their symbols, and the unique Bochner connection
of a Laplace-type operator. P4: composition, adjoints and global bundles. P5: Sobolev mapping
estimates. P6: ellipticity, parametrices, local elliptic regularity and Fredholm theory. P7: the
parameter-dependent resolvent calculus and elliptic powers (§7.1), and the unitary comparison of `L²`
of an external bundle with the Hilbert tensor product, Fubini and density, and the graph domain of the
doubled operator (§7.2).

### From TauCetiRoadmap.CompactQuantumMetricSpaces

§3.1: the classical Lipschitz constant with its `LipschitzWith` comparison, algebraic laws and the
bounded-witness distance formula. §3.6: on a closed connected Riemannian manifold with a nonzero-fibre
Hermitian Clifford module, the point metric of the Dirac commutator seminorm is the geodesic distance,
and the state metric is `W₁`.

### From TauCetiRoadmap.FourManifolds

F4 (§4.1): Spinᶜ(n) with its projection to `SO(n)`, central circle, determinant character,
associated-bundle and lift API, line twists, restrictions and integral lifts of `w₂`; §4.2: the Wu
identities.

### From TauCetiRoadmap.SpinGeometry

G1 (negative-metric Clifford modules, classifiers; G1.3 matrix-module evaluation; G1.4 odd factors and
the volume element `ω_Spin`), G2 (chirality and exterior-form comparisons; G2.1 the intrinsic
chirality), G3.3 (Clifford-compatible connections), G3.4 (the exterior connection, `c = ε − ι`), G4–G5
(Spin lifts, spinor bundles, the lifted Levi-Civita connection), G6.0 (the real Clifford-linear
analytic index), G6.1 (Dirac operators, with minimal and maximal domains `H¹` on closed bases), G6.3
(Lichnerowicz formulas), G6.4 (the exterior Dirac operator, Euler and signature operators), G6.5
(circle, torus and sphere instances).

### From TauCetiRoadmap.RiemannianGeometry

R7.8: on a Riemannian manifold with a nonzero-fibre Hermitian Clifford module, `[D, M_f] = c(df)`
with operator norm `sup |df|`, smooth Lipschitz approximation, and the duality
`dist(p, q) = sup{|f(p) − f(q)| : sup |df| ≤ 1}`.

### From TauCetiRoadmap.OperatorKTheory

K3 (Bott periodicity, boundary maps, the graded exterior product with its flip sign), K5 (graded
Kasparov cycles, parity reduction, bounded and unbounded cycles, the bounded transform), K6 (the
Kasparov product with its graded interchange law, and index pairings).

### From TauCetiRoadmap.IndexTheory

I2 (symbol classes and the analytic index) to I7 (Euler, signature, Dolbeault and spin applications).

### From TauCetiRoadmap.GeneralizedCohomology

G5.5: the KO Thom orientation of a real spin bundle by the Clifford-module construction.

## References

- A. Connes, [*On the spectral characterization of manifolds*, arXiv
  0810.2088v1](https://arxiv.org/html/0810.2088v1) (2008): §§2–10, 11.3–11.5 and Appendices 13–14
  give the strengthened reconstruction proof; Theorem 11.5 treats the even minimal-multiplicity
  case, while 11.3–11.4 do not require minimal multiplicity; Appendix 2 (Theorem 14.9, Corollary
  14.10) relates the Dixmier trace to spectral-cutoff and heat limits; §9 states the normalization
  of Voiculescu's modulus and proves the local estimate. Layer 4 builds the Voiculescu ingredient
  used by that proof.
- L. Dąbrowski and G. Dossena, [*Product of real spectral triples*, arXiv
  1011.4456v1](https://arxiv.org/html/1011.4456v1), §§2–5: KO signs, opposite action, products by
  parity and the domain and eigenblock proof. The shuffle factors of §10.4 are fixed directly by
  counting shuffles.
- B. Ćaćić, [*Real structures on almost-commutative spectral triples*, arXiv
  1209.4832v2](https://arxiv.org/html/1209.4832v2) (2012), §§1.1, 2.1–2.4: the distinction between
  irreducible Clifford, Spinᶜ and Spin data, charge conjugation, KO signs (Definition 2.5: the
  grading belongs to the real-structure data exactly in even KO-dimension), the reducible real-form
  example (Example 2.9), real Clifford modules of arbitrary KO-dimension over a reconstructed
  manifold (Proposition 2.16), products branched by KO parity (Theorem 2.18) and commutative triples
  of every KO-dimension (Proposition 2.24). Its real structures on reducible bundles do not imply
  Spin.
- B. Ćaćić, [*A reconstruction theorem for almost-commutative spectral triples*, arXiv
  1101.5908v4](https://arxiv.org/html/1101.5908v4), Corollary 2.19 and Appendix A: the
  weak-orientation perturbation argument; §7.8 keeps all its domain, regularity and trace
  perturbation obligations.
- D. Voiculescu, *Some results on norm-ideal perturbations of Hilbert space operators, I*, J. Operator
  Theory 2 (1979), 3–37, Theorem 4.5: the multiplicity theorem built in §4.3.
- W. Rudin, *Functional Analysis*, 2nd ed., McGraw-Hill (1991), Theorem 2.11 (open mapping theorem for
  F-spaces) and Theorem 2.15 (closed graph theorem), the two theorems of §3.2.
- R. G. Swan, *Vector bundles and projective modules*, Trans. Amer. Math. Soc. 105 (1962), 264–277,
  Theorem 2: the continuous Serre–Swan theorem on a compact Hausdorff space, refined to the smooth
  setting in §3.3; J. Nestruev, *Smooth Manifolds and Observables*, GTM 220, Springer (2003), Chapter
  11, for the smooth statement.
- L. Hörmander, *The spectral function of an elliptic operator*, Acta Math. 121 (1968), 193–218: the
  leading Weyl asymptotics with remainder for positive elliptic operators on closed manifolds (§7.6).
- M. Sh. Birman, L. S. Koplienko and M. Z. Solomyak, *Estimates for the spectrum of the difference
  between fractional powers of two self-adjoint operators*, Izv. Vyssh. Uchebn. Zaved. Mat. 1975,
  no. 3, 3–10, and T. Ando, *Comparison of norms |||f(A)−f(B)||| and |||f(|A−B|)|||*, Math. Z. 197
  (1988), 403–409: the fractional-power inequality of §7.9, the first for the trace norm and the second
  for every unitarily invariant norm.
- R. J. Plymen, [*Strong Morita equivalence, spinors and symplectic spinors*, J. Operator Theory 16
  (1986), 305–324](https://jot.theta.ro/jot/archive/1986-016-002/1986-016-002-008.html), Theorem
  2.11 (even rank) and the remark following its proof (odd rank): Spinᶜ structures on an oriented
  Euclidean bundle, Plymen's "spin-structures" of Definition 2.10, correspond to irreducible modules
  over its complex Clifford bundle, with the even subalgebra in odd rank by Definition 2.2; the
  dictionary of §8.2.
- J.-L. Loday, *Cyclic Homology*, 2nd ed., Grundlehren 301, Springer (1998), §4.2: the shuffle map on
  Hochschild chains and its chain-map property, with the sign convention of §10.4.
- F. Trèves, *Topological Vector Spaces, Distributions and Kernels*, Academic Press (1967), Chapter 51:
  nuclearity of smooth function spaces and the identification of `C∞(X × Y)` with the completed tensor
  product (§10.6).
