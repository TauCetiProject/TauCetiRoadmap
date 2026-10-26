# Roadmap: Sobolev spaces of differential forms and the L² de Rham complex

Mathlib has differential forms on normed spaces as maps `E → E [⋀^Fin k]→L[ℝ] F` with the exterior
derivative `extDeriv` and `extDeriv_extDeriv`; Tau Ceti has test forms with
`TauCeti.TestFunction.extDerivCLM` (`d ∘ d = 0` on `𝓓(Ω, E [⋀^Fin k]→L[ℝ] F)`), weak derivatives
`TauCeti.HasWeakFDerivOn`, and the scalar Sobolev spaces `TauCeti.W1p`, `TauCeti.Wkp`. This roadmap
builds the **Sobolev theory of differential forms on a Euclidean domain**: the weak exterior
derivative, the Hilbert spaces `HΛᵏ(Ω)` (in dimension three: `H¹`, `H(curl)`, `H(div)`, `L²`), the
**L² de Rham complex** as a Hilbert complex with its Hodge decomposition, pullback under
diffeomorphisms, traces and gluing across interfaces, and **compactness and closed range** of the
complex on bounded Lipschitz domains.

The bar for "done": someone working with mixed formulations, Maxwell's equations or Hodge
Laplacians on a domain finds `HΛᵏ(Ω)` with the API they expect (density, pullback, traces,
gluing, closed range, Hodge decomposition) and the vector-calculus special cases connected to it.

## Standing setting

- `n : ℕ`, `E := EuclideanSpace ℝ (Fin n)`, Lebesgue measure; `Ω : TopologicalSpace.Opens E`,
  bounded where stated. Forms are real-valued: a `k`-form on `Ω` is a function
  `Ω → E [⋀^Fin k]→L[ℝ] ℝ` (Mathlib's `ContinuousAlternatingMap`).
- **The pointwise inner product on `k`-covectors.** Mathlib's norm on `E [⋀^Fin k]→L[ℝ] ℝ` is the
  operator norm, which is not a Hilbert norm. Define the Euclidean inner product
  `⟪α, β⟫ := ∑_{I} α(e_I) β(e_I)` (sum over strictly increasing `I : Fin k → Fin n`, `e_I` the
  corresponding standard basis vectors), prove it is an inner product, that it is invariant under
  orthogonal maps of `E`, and the two-sided comparison with the operator norm with constants in
  `n, k`. Package `k`-covectors with this inner product as a finite-dimensional inner product space
  `Covector n k` (with the identity linear equivalence to `E [⋀^Fin k]→L[ℝ] ℝ`).
- `L²Λᵏ(Ω) := Lp (Covector n k) 2 (volume.restrict Ω)`, a Hilbert space.

## Milestone 1: the weak exterior derivative

1. **Definition.** `u ∈ L¹_loc` has weak exterior derivative `w` on `Ω` (`HasWeakExtDerivOn Ω u w`)
   if for every scalar test function `ψ ∈ 𝓓(Ω, ℝ)` and every `v : Fin (k+1) → E`:
   `∫ w x v · ψ x = − ∑ j, (−1)^j ∫ u x (Fin.removeNth j v) · fderiv ℝ ψ x (v j)`.
   Prove: uniqueness a.e.; linearity; agreement with Mathlib's `extDeriv` for `C¹` forms; for `k = 0`
   agreement with `TauCeti.HasWeakFDerivOn` (a `0`-form is a function); the equivalent formulation
   by duality against test forms of degree `k + 1` through the formal adjoint (codifferential) of
   `TauCeti.TestFunction.extDerivCLM` with respect to `⟪·,·⟫`; locality (restriction to open subsets
   and gluing over an open cover).
2. **`d ∘ d = 0`.** If `HasWeakExtDerivOn Ω u w` and `HasWeakExtDerivOn Ω w z` then `z = 0` a.e.;
   and every weakly closed form has weak derivative zero in the next degree.
3. **Leibniz rule with smooth factors.** `d(φ ∧ u) = dφ ∧ u + (−1)^j φ ∧ du` for smooth bounded `φ`
   with bounded derivative (the wedge product of covectors as Mathlib's alternatization of the
   tensor product, or Mathlib's wedge on `ContinuousAlternatingMap` where it exists).

## Milestone 2: the spaces `HΛᵏ(Ω)`

4. **`HΛᵏ(Ω)`** := `{u ∈ L²Λᵏ(Ω) | ∃ w ∈ L²Λᵏ⁺¹(Ω), HasWeakExtDerivOn Ω u w}` with the graph inner
   product `⟪u, v⟫ + ⟪du, dv⟫`; prove it is a Hilbert space and that `d : HΛᵏ(Ω) → L²Λᵏ⁺¹(Ω)` is
   bounded, with range in the kernel of `d` on `HΛᵏ⁺¹(Ω)`.
5. **`d` as an unbounded operator.** `d` is a closed, densely defined operator
   `L²Λᵏ(Ω) → L²Λᵏ⁺¹(Ω)` with domain `HΛᵏ(Ω)` (Mathlib's `LinearPMap`, `LinearPMap.IsClosed`),
   with adjoint the weak codifferential with natural boundary conditions.
6. **Density.** `C^∞(Ω) ∩ HΛᵏ(Ω)` is dense in `HΛᵏ(Ω)` for every open `Ω` (the Meyers–Serrin
   argument with mollification commuting with `d` on interior subdomains).
7. **Zero boundary values.** `HΛᵏ₀(Ω)` := closure of test forms; `d` maps `HΛᵏ₀` into `HΛᵏ⁺¹₀`;
   extension by zero is an isometry `HΛᵏ₀(Ω) → HΛᵏ(E)` commuting with `d`.
8. **Degree zero and top degree.** `HΛ⁰(Ω) = W^{1,2}(Ω)` as Hilbert spaces (with
   `TauCeti.W1p volume Ω 2`), and `HΛⁿ(Ω) = L²Λⁿ(Ω)`.
9. **Vector proxies in dimension three.** For `n = 3`, define the weak curl and divergence of vector
   fields in `L²(Ω; ℝ³)`, the spaces `H(curl, Ω)`, `H(div, Ω)`, and the isometric isomorphisms
   `HΛ¹ ≃ H(curl)`, `HΛ² ≃ H(div)` (via the proxies `α ↦ (α e₁, α e₂, α e₃)` and the Hodge
   star) under which `d` becomes `grad`, `curl`, `div`. Tau Ceti's weak divergence
   (`TauCeti/Analysis/Sobolev/WeakDeriv/Divergence.lean`) is the degree `n − 1` case for every `n`.

## Milestone 3: pullback and change of variables

10. **Pullback.** For a `C¹` diffeomorphism `Φ : Ω' → Ω` with `‖DΦ‖, ‖DΦ⁻¹‖ ≤ L` and `|det DΦ| ≥ c`:
    the pullback `Φ^* u` maps `HΛᵏ(Ω)` to `HΛᵏ(Ω')`, commutes with the weak `d`, and has explicit
    norm bounds in `n, k, L, c`. Specialize to affine maps `F x = B x + b`:
    `‖F^* u‖_{L²Λᵏ(F⁻¹ Ω)} ≤ ‖B‖^k |det B|^{−1/2} ‖u‖_{L²Λᵏ(Ω)}`, and in dimension three identify the
    affine pullbacks with the covariant and contravariant Piola transforms of `H(curl)` and `H(div)`.
    The same for a bi-Lipschitz homeomorphism `Φ : Ω' → Ω` with Lipschitz constants `≤ L` for `Φ`
    and `Φ⁻¹`, with `DΦ` defined a.e. by Rademacher's theorem: `Φ^*` maps `HΛᵏ(Ω)` to `HΛᵏ(Ω')` and
    `HΛᵏ₀(Ω)` to `HΛᵏ₀(Ω')`, commutes with the weak `d`, and has norm bounds in `n, k, L`.

## Milestone 4: traces, Green's formula, and gluing

Consumes Geometric measure theory G6 (Gauss–Green for locally finite-perimeter sets, integration by
parts with the trace term for BV functions on Lipschitz domains, gluing across a Lipschitz
interface) and PDE Lane A.6 (the Lipschitz-domain predicate `Set.IsLipschitzDomainWith`, the
`W^{1,p}` trace, `μHE[n−1]` on the frontier).

11. **Tangential trace of continuous forms.** For a bounded Lipschitz domain `Ω` and a form `u`
    continuous on `closure Ω`, the tangential trace `tr u` on `frontier Ω` (the restriction of `u x`
    to the approximate tangent space, defined `μHE[n−1]`-a.e. through the outward normal of G6).
12. **Green's formula.** For `u` a `k`-form and `φ` an `(n−k−1)`-form, both Lipschitz on
    `closure Ω` of a bounded Lipschitz domain:
    `∫_Ω du ∧ φ + (−1)^k ∫_Ω u ∧ dφ = ∫_{∂Ω} tr u ∧ tr φ` (the boundary integral against
    `μHE[n−1]` and the outward normal), from G6's integration by parts applied to the components.
13. **Weak characterization of zero trace.** For bounded Lipschitz `Ω`: `u ∈ HΛᵏ₀(Ω)` if and only if
    `u ∈ HΛᵏ(Ω)` and `∫_Ω du ∧ φ + (−1)^k ∫_Ω u ∧ dφ = 0` for every smooth `φ` on `E` (smooth up to
    the boundary, not compactly supported in `Ω`).
14. **Gluing across interfaces.** Let `Ω` be open and `Ω₁, …, Ω_m` pairwise disjoint bounded Lipschitz
    domains with `closure Ω ⊆ ⋃ closure Ωᵢ` and `Ω ⊆ ⋃ closure Ωᵢ`. Let `u ∈ L²Λᵏ(Ω)` be Lipschitz on
    each `closure Ωᵢ` (as a restriction). Then `u ∈ HΛᵏ(Ω)`, with weak derivative equal to the
    piecewise classical `du` a.e., if and only if on every shared boundary piece
    `frontier Ωᵢ ∩ frontier Ωⱼ ∩ Ω` the tangential traces from `Ωᵢ` and `Ωⱼ` agree `μHE[n−1]`-a.e.
    For `k = 0` this is the statement that a function Lipschitz on each piece is in `W^{1,p}(Ω)` iff
    its traces agree on interfaces; prove the scalar case for every `1 ≤ p ≤ ∞` (from G6's BV gluing
    and A.6's trace). In dimension three, state the proxy forms: tangential continuity for `H(curl)`,
    normal continuity for `H(div)`.

## Milestone 5: the L² de Rham complex as a Hilbert complex

15. **Abstract Hilbert complexes.** A sequence of closed densely defined operators
    `dᵏ : Wᵏ → Wᵏ⁺¹` between Hilbert spaces with `range dᵏ ⊆ ker dᵏ⁺¹` (Brüning–Lesch;
    Arnold–Falk–Winther §3). Prove: the **Hodge decomposition**
    `Wᵏ = closure (range dᵏ⁻¹) ⊕ 𝔥ᵏ ⊕ closure (range dᵏ*)` with harmonic space
    `𝔥ᵏ = ker dᵏ ∩ ker dᵏ⁻¹*`; that `range dᵏ` closed is equivalent to the **Poincaré inequality**
    `‖u‖ ≤ c ‖dᵏ u‖` for `u ∈ dom dᵏ ∩ (ker dᵏ)ᗮ`; the dual complex; the **abstract Hodge Laplacian**
    and its well-posedness when the ranges are closed and `𝔥ᵏ` is finite dimensional; and that if
    `dom dᵏ ∩ dom dᵏ⁻¹*` (with its graph norm) embeds compactly into `Wᵏ`, then `range dᵏ⁻¹` and
    `range dᵏ` are closed and `𝔥ᵏ` is finite dimensional. Use Mathlib's
    `LinearPMap` and Tau Ceti's unbounded-operator API.
16. **The L² de Rham complex** `L²Λ⁰ → L²Λ¹ → ⋯ → L²Λⁿ` with domains `HΛᵏ(Ω)` (and the version with
    domains `HΛᵏ₀(Ω)`) is a Hilbert complex; its dual complex is the codifferential complex.

## Milestone 6: compactness and closed range on bounded Lipschitz domains

17. **Compact embeddings (Picard).** Let `Ω` be a bounded Lipschitz domain (PDE Lane A.6's
    `Set.IsLipschitzDomainWith`) and `ε` a measurable field of symmetric endomorphisms of
    `Covector n k` with `λ ≤ ε ≤ Λ` pointwise for constants `0 < λ ≤ Λ`. Write `H*_εΛᵏ(Ω)` for
    the domain of the adjoint of `d : HΛᵏ⁻¹₀(Ω) → L²Λᵏ(Ω)` with respect to the inner product
    weighted by `ε` on `L²Λᵏ(Ω)`, and `H*_εΛᵏ₀(Ω)` for the domain of the adjoint of
    `d : HΛᵏ⁻¹(Ω) → L²Λᵏ(Ω)`, each with its graph norm. Then the inclusions
    `HΛᵏ₀(Ω) ∩ H*_εΛᵏ(Ω) → L²Λᵏ(Ω)` and `HΛᵏ(Ω) ∩ H*_εΛᵏ₀(Ω) → L²Λᵏ(Ω)` are compact. The proof is
    Picard's: localize in the finite chart cover of A.6 with a partition of unity, pull back
    by the bi-Lipschitz chart maps (item 10), which changes `ε` within the same class, and
    reduce to Rellich (A.6). The weights are part of the statement because the pullback
    produces them.
18. **Closed range and harmonic spaces.** From items 15 and 17 (with `ε = 1`): on a bounded
    Lipschitz domain, both L² de Rham complexes of item 16 have closed ranges and
    finite-dimensional harmonic spaces, the Poincaré inequality `‖u‖ ≤ c ‖du‖` holds on
    `HΛᵏ(Ω) ∩ (ker d)ᗮ` and on `HΛᵏ₀(Ω) ∩ (ker d)ᗮ` (with a non-explicit constant), and the
    abstract Hodge Laplacian of item 15 is well posed.

## Boundaries

- **In scope:** everything above, for real-valued forms on open subsets of
  `EuclideanSpace ℝ (Fin n)`.
- **Consumed:** scalar Sobolev spaces and traces (PDE Lane A), Gauss–Green and BV traces
  (Geometric measure theory G6), smooth forms and `extDeriv` (Mathlib; the manifold theory of
  *Differential geometry — forms, de Rham cohomology* is not needed and not duplicated).
- **Not here:** forms on manifolds and the L² theory on Riemannian manifolds; the identification of
  the harmonic spaces on a Lipschitz domain with de Rham cohomology; boundary conditions on a
  part of the boundary; regularized Poincaré and Bogovskiĭ operators and explicit Poincaré
  constants; fractional trace spaces (`H^{−1/2}`); approximation of forms by piecewise polynomial forms on partitions of a domain.

## Acceptance criteria

- `HΛᵏ(Ω)`, `HΛᵏ₀(Ω)` and the weak `d` have the basic API (restriction, extension by zero, pullback,
  density, degree-zero and top-degree identifications) before Milestones 5 and 6 start.
- The gluing theorem is tested on two half-cubes sharing a face: a form continuous across the face
  is in `HΛᵏ`, a form whose tangential part jumps is not.
- In dimension three the proxy statements (`grad`, `curl`, `div`; tangential and normal continuity)
  are stated as theorems, not only as remarks.

## References

- D. N. Arnold, R. S. Falk, R. Winther, *Finite element exterior calculus, homological techniques,
  and applications*, Acta Numerica 15 (2006), §2–3; *Finite element exterior calculus: from Hodge
  theory to numerical stability*, Bull. AMS 47 (2010), §3–4.
- D. N. Arnold, *Finite Element Exterior Calculus*, SIAM, 2018, Chapters 4 and 6.
- J. Brüning, M. Lesch, *Hilbert complexes*, J. Funct. Anal. 108 (1992).
- R. Picard, *An elementary proof for a compact imbedding result in generalized electromagnetic
  theory*, Math. Z. 187 (1984).
- V. Girault, P.-A. Raviart, *Finite Element Methods for Navier–Stokes Equations*, Springer, 1986,
  Chapter I (`H(div)`, `H(curl)`).
- P. Monk, *Finite Element Methods for Maxwell's Equations*, Oxford, 2003, Chapter 3.
