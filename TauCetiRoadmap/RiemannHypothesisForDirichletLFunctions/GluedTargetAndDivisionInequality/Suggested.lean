import Mathlib

/-!
# The glued target and the division inequality: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. One of them,
integrality after division (7.12), is a statement about number fields, their finite places and
lattices in finite-dimensional vector spaces, and is stated below. The others are not statable at
the pins.

They are statements about the chain of theta lifts between definite unitary groups of
ThetaChainsOnDefiniteUnitaryGroups: its words, the lattices of algebraic automorphic forms on the
definite unitary groups of the chain with their Petersson metrics, the period pairing of
SeesawForThetaChains and the target rows of RowTowerAndRallisIdentities, read as Hermitian
lattices over the ring of integers of the field of places, with metrics at every complex
embedding, and measured by Bost's slopes and heights (SlopesOfHermitianVectorBundles §§1.1–2.4).
Mathlib has number fields, their rings of integers, finite places and fractional ideals, Hermitian
forms on vector spaces over `ℂ` and the unitary group of a matrix ring, but no Hermitian lattice
over the ring of integers of a number field with metrics at its embeddings, no Arakelov degree or
slope of such a lattice, and no unitary group of a Hermitian space over a CM field with its adelic
points, its algebraic automorphic forms, theta lifts or Weil representations. Tau Ceti has heights
of points and the height `TauCeti.subspaceHeight` of a subspace of `K^n` for the standard
metrics, which do not give these lattices either.

* Integrality after division for the chain (7.13, 7.14): for every word `u`, the period pairing
  `B_u` maps the source lattice divided by the ideal of the gain exponents into the lattice of
  `c_𝕃`-semilinear functionals integral on the glued target. It lacks the source lattices of
  algebraic automorphic forms of the chain, the gain exponents, the target rows with their rational
  structure, the forms of the tuples of twists and the period pairing.
* The height of the period pairing (8.9): under the size condition on the level prime and the size
  predicate of the grid at large scales, `ht(B_u) ≤ h_u` for the explicit height `h_u`. It lacks, besides
  these, the Petersson metrics on the source and target lattices, operator norms at every embedding
  of the field of places, the step operators of the chain, its top period, the Rallis eigenvalues
  and the CM period of the host.
* The division inequality (8.22), with the slope of the target (8.21) and its maximal slope (8.24):
  for a good twisting datum with the support condition, a host with wild-kernel budget `1`,
  `[F:ℚ] ≥ 2` and the size conditions of the chain, `μ(R^∨) + h_u − F_tot` is at most the sum over
  the top places of `m·(ph(a_τ) − a_τ·log Ω) − a_τ·log T(u)` plus the stated errors. It lacks, besides
  these, the slope and maximal slope of a Hermitian lattice over a ring of integers, the glued
  target and its lattice of semilinear functionals, the bulk divisibility of the chain, the
  congruence lengths and the wild kernels `Ш¹(E, ℓ, e)` of the host.

The lemmas of Layer 8 on Taylor blocks in the Fock model (8.2), pointwise bounds for theta
functions (8.3) and Stirling terms against hook products (8.10) are statements about entire
functions on `ℂ^n`, lattices in `ℂ^g` and Young diagrams; they are steps of the routes to the
headlines, not headlines, and are not stated here.
-/

open NumberField IsDedekindDomain
open scoped nonZeroDivisors

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.GluedTargetAndDivisionInequality

/-! ## Layer 7: Division of the source and the glued target -/

/-- **Integrality after division** (README 7.12). Let `L` be a number field, `c` an automorphism of
`L`, `V`, `W` finite-dimensional `L`-spaces and `B : V × W → L` linear in `V` and `c`-semilinear in
`W`; let `N ⊂ V` and `R ⊂ W` be lattices (finitely generated `𝓞 L`-submodules spanning over `L`).
Suppose that for every finite place `𝔭` of `L` there are an `L`-space `U 𝔭` with a lattice `M 𝔭`,
an `L`-linear map `j 𝔭 : U 𝔭 → W` with `R ⊂ 𝒪_(c⁻¹(𝔭))·j 𝔭 (M 𝔭)` (every `x ∈ R` has a multiple
`d • x ∈ j 𝔭 (M 𝔭)` by some `d ∈ 𝓞 L` with `c d ∉ 𝔭`), a map `P 𝔭 : V × U 𝔭 → L` and a `𝔭`-unit
`ζ 𝔭` with `P 𝔭 φ Υ = ζ 𝔭 * B φ (j 𝔭 Υ)`, and a real `σ 𝔭` such that for `φ ∈ N`, `Υ ∈ M 𝔭` either
`P 𝔭 φ Υ = 0` or `v_𝔭(P 𝔭 φ Υ) ≥ σ 𝔭`. Let `τ 𝔭 ∈ ℤ`, zero for almost all `𝔭`, with
`τ 𝔭 ≤ ⌈σ 𝔭⌉`, and `N′ := (∏_𝔭 𝔭^(-τ 𝔭))·N`. Then `B(N′, R) ⊂ 𝓞 L`. -/
theorem pairing_integral_of_localDivision
    {L : Type*} [Field L] [NumberField L] (c : L ≃+* L)
    {V W : Type*} [AddCommGroup V] [Module L V] [FiniteDimensional L V]
    [Module (𝓞 L) V] [IsScalarTower (𝓞 L) L V]
    [AddCommGroup W] [Module L W] [FiniteDimensional L W]
    [Module (𝓞 L) W] [IsScalarTower (𝓞 L) L W]
    (B : V →ₗ[L] W →ₛₗ[(c : L →+* L)] L)
    (N : Submodule (𝓞 L) V) (hN : N.FG) (hNspan : Submodule.span L (N : Set V) = ⊤)
    (R : Submodule (𝓞 L) W) (hR : R.FG) (hRspan : Submodule.span L (R : Set W) = ⊤)
    (U : HeightOneSpectrum (𝓞 L) → Type*) [∀ 𝔭, AddCommGroup (U 𝔭)] [∀ 𝔭, Module L (U 𝔭)]
    [∀ 𝔭, Module (𝓞 L) (U 𝔭)] [∀ 𝔭, IsScalarTower (𝓞 L) L (U 𝔭)]
    (M : ∀ 𝔭, Submodule (𝓞 L) (U 𝔭)) (hM : ∀ 𝔭, (M 𝔭).FG)
    (hMspan : ∀ 𝔭, Submodule.span L (M 𝔭 : Set (U 𝔭)) = ⊤)
    (j : ∀ 𝔭, U 𝔭 →ₗ[L] W)
    (hRloc : ∀ 𝔭 : HeightOneSpectrum (𝓞 L), ∀ x ∈ R, ∃ d : 𝓞 L, 𝔭.valuation L (c (d : L)) = 1 ∧
      d • x ∈ (M 𝔭).map ((j 𝔭).restrictScalars (𝓞 L)))
    (P : ∀ 𝔭, V → U 𝔭 → L) (ζ : HeightOneSpectrum (𝓞 L) → L)
    (hζ : ∀ 𝔭 : HeightOneSpectrum (𝓞 L), 𝔭.valuation L (ζ 𝔭) = 1)
    (hP : ∀ 𝔭 φ Υ, P 𝔭 φ Υ = ζ 𝔭 * B φ (j 𝔭 Υ))
    (σ : HeightOneSpectrum (𝓞 L) → ℝ)
    (hσ : ∀ 𝔭 : HeightOneSpectrum (𝓞 L), ∀ φ ∈ N, ∀ Υ ∈ M 𝔭, P 𝔭 φ Υ = 0 ∨
      σ 𝔭 ≤ (FractionalIdeal.count L 𝔭 (FractionalIdeal.spanSingleton (𝓞 L)⁰ (P 𝔭 φ Υ)) : ℝ))
    (τ : HeightOneSpectrum (𝓞 L) →₀ ℤ) (hτ : ∀ 𝔭 : HeightOneSpectrum (𝓞 L), τ 𝔭 ≤ ⌈σ 𝔭⌉) :
    ∀ φ ∈ Submodule.span (𝓞 L) {y : V | ∃ a ∈ (∏ᶠ 𝔭 : HeightOneSpectrum (𝓞 L),
        (𝔭.asIdeal : FractionalIdeal (𝓞 L)⁰ L) ^ (-τ 𝔭)), ∃ n ∈ N, y = a • n},
      ∀ x ∈ R, B φ x ∈ (algebraMap (𝓞 L) L).range := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.GluedTargetAndDivisionInequality
