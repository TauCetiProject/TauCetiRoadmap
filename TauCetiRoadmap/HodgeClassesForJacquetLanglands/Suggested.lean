module

import Mathlib

/-!
# Hodge classes for the Jacquet–Langlands correspondence: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, and only
the one predicate those statements need.

Stated here (Layer 1 of the README, the Hermitian exterior construction):

* `existsUnique_isExteriorStar` (§1.3): on the second exterior power of a four-dimensional space
  with a sesquilinear form and a trivialised top exterior power there is exactly one
  conjugate-linear operator `L` whose wedge pairing reproduces the induced determinant pairing.
* `IsExteriorStar.comp_self` (§1.4): for a Hermitian form, `L ∘ L` is multiplication by the volume
  of the form (Ichino–Prasanna, Proposition 5.3). This is what makes `⋀²U` a right module over the
  quaternion algebra `(E, vol)`.
* `IsExteriorStar.map_similitude` (§1.7): for a similitude `g` with multiplier `ν`,
  `L ∘ ⋀²g = (ν² / det g) • (⋀²g ∘ L)`; on similitudes with `det g = ν²` the exterior action is
  therefore linear over that quaternion algebra (Ichino–Prasanna, Proposition 5.6, equation (5.10)).

Headline theorems that are not statable at the pins, and what each lacks:

* The Hodge class realising the Jacquet–Langlands correspondence (§10.7; Ichino–Prasanna,
  Theorem 3.2(i) and Theorem 12.4(i)) and the rational weight-two correspondence (§10.9;
  Theorem 1(i)): quaternionic Shimura varieties, their cohomology with automorphic coefficient
  systems and its Hodge structure, cuspidal automorphic representations of `GL₂(𝔸_F)` and of
  quaternion unit groups, and the global Jacquet–Langlands transfer are absent.
* The conditional all-`ℓ` Galois statement (§10.8; Theorem 3.2(ii), Theorem 12.4(ii)):
  additionally lacks étale cohomology of canonical models with `ℓ`-adic coefficient systems and
  Galois action, and the degree-`2d` Kottwitz hypothesis of §9.2 that it assumes.
* The exceptional isogeny `GSU_E(U) → GU_B(⋀²U)°` with kernel `μ₂` and the exceptional
  isomorphism `PGU_E(U) ≃ PGU_B(⋀²U)°` (§§1.7–1.8; Propositions 5.6–5.7) as statements about
  algebraic groups: unitary and quaternionic skew-Hermitian similitude group schemes over `F` are
  absent (Tau Ceti's affine algebraic groups have isogenies, identity components, and the quotient
  by the centre only as an fppf sheaf without a representing group scheme). Their point-level
  content is the two operator identities stated below.
* The simultaneous nonvanishing of restricted theta classes (§7.10; Proposition 10.1),
  near-equivalence rigidity of quaternionic theta lifts (§6.5; Proposition 9.5) and the purity of
  the theta Hecke space (§8.8; Proposition 11.6, Corollary 11.7): global theta lifts, automorphic
  forms on similitude groups, relative Lie algebra cohomology and the cohomology of Shimura
  varieties with its Hodge decomposition are absent.
* The restriction formulas for the harmonic Schwartz forms (§§4.5–4.6; Propositions 8.1–8.2):
  the Fock model of the real Weil representation and Schwartz-valued relative Lie algebra cochains
  with harmonic coefficients are absent.
* De Rham additive characters are unramified (§9.3) and the triviality of geometric unipotent
  extensions (§9.4; Remark 11.10): Fontaine's period ring `B_dR`, and with it the de Rham condition
  on `ℓ`-adic Galois representations, is absent. Continuous group cohomology is present, but without
  the de Rham hypothesis both statements are false.
-/

open Module exteriorPower

namespace TauCetiRoadmap.HodgeClassesForJacquetLanglands

/-! ## Layer 1: the Hermitian exterior construction -/

/-- `L` is the exterior operator of the sesquilinear form `H` relative to the trivialisation `vol`
of the top exterior power: for every pure wedge `u₁ ∧ u₂` and every `y ∈ ⋀²U`, the wedge pairing of
`L (u₁ ∧ u₂)` with `y` equals the induced determinant pairing `det [H uᵢ (·)]` evaluated at `y`.
The form `H` is conjugate-linear in its first argument (Ichino–Prasanna, §5.2, pp. 27–28). -/
def IsExteriorStar {E U : Type*} [Field E] [AddCommGroup U] [Module E U] {σ : E →+* E}
    (H : U →ₛₗ[σ] U →ₗ[E] E) (vol : ⋀[E]^(finrank E U) U ≃ₗ[E] E)
    (hkl : 2 + 2 = finrank E U) (L : ⋀[E]^2 U →ₛₗ[σ] ⋀[E]^2 U) : Prop :=
  ∀ (u : Fin 2 → U) (y : ⋀[E]^2 U),
    wedgePairing vol hkl (L (ιMulti E 2 u)) y =
      pairingDual E U 2 (ιMulti E 2 fun i => H (u i)) y

/-- Existence and uniqueness of the exterior operator: on a four-dimensional space with a
sesquilinear form `H` and a trivialisation `vol` of the top exterior power there is exactly one
`σ`-semilinear `L : ⋀²U → ⋀²U` with the defining wedge-pairing identity. No Hermitian symmetry or
nondegeneracy of `H` is needed (Ichino–Prasanna, §5.2, the composite `L = ψ⁻¹ ∘ ι ∘ ∧²φ` built
from (5.1)–(5.4)). -/
theorem existsUnique_isExteriorStar {E U : Type*} [Field E] [AddCommGroup U] [Module E U]
    [FiniteDimensional E U] {σ : E →+* E} (H : U →ₛₗ[σ] U →ₗ[E] E)
    (vol : ⋀[E]^(finrank E U) U ≃ₗ[E] E) (hkl : 2 + 2 = finrank E U) :
    ∃! L : ⋀[E]^2 U →ₛₗ[σ] ⋀[E]^2 U, IsExteriorStar H vol hkl L := by
  sorry

/-- The square of the exterior operator is the volume (Ichino–Prasanna, Proposition 5.3): if `H`
is Hermitian, `H y x = σ (H x y)`, then `L (L x) = vol(H, vol) • x`, where for any basis `b` of `U`
the volume is `det [H (b i) (b j)] / (σ c * c)` with `c = vol (b₁ ∧ b₂ ∧ b₃ ∧ b₄)`. The identity
holds for every basis, so the volume does not depend on the basis; it vanishes exactly when `H` is
degenerate. -/
theorem IsExteriorStar.comp_self {E U : Type*} [Field E] [AddCommGroup U] [Module E U]
    [FiniteDimensional E U] {σ : E →+* E} {H : U →ₛₗ[σ] U →ₗ[E] E}
    {vol : ⋀[E]^(finrank E U) U ≃ₗ[E] E} {hkl : 2 + 2 = finrank E U}
    {L : ⋀[E]^2 U →ₛₗ[σ] ⋀[E]^2 U} (hL : IsExteriorStar H vol hkl L)
    (hH : ∀ x y, H y x = σ (H x y)) (b : Basis (Fin (finrank E U)) E U) (x : ⋀[E]^2 U) :
    L (L x) = ((Matrix.of fun i j => H (b i) (b j)).det /
      (σ (vol (ιMulti E (finrank E U) b)) * vol (ιMulti E (finrank E U) b))) • x := by
  sorry

/-- Equivariance of the exterior operator under similitudes (Ichino–Prasanna, proof of
Proposition 5.6, equation (5.10)): if `g` is an `E`-linear automorphism of `U` with
`H (g x) (g y) = ν * H x y`, then `L (⋀²g x) = (ν² / det g) • ⋀²g (L x)`. When `det g = ν²` the
exterior action `⋀²g` commutes with `L`, hence with the right action of the quaternion
algebra `(E, vol)`. -/
theorem IsExteriorStar.map_similitude {E U : Type*} [Field E] [AddCommGroup U] [Module E U]
    [FiniteDimensional E U] {σ : E →+* E} {H : U →ₛₗ[σ] U →ₗ[E] E}
    {vol : ⋀[E]^(finrank E U) U ≃ₗ[E] E} {hkl : 2 + 2 = finrank E U}
    {L : ⋀[E]^2 U →ₛₗ[σ] ⋀[E]^2 U} (hL : IsExteriorStar H vol hkl L)
    (g : U ≃ₗ[E] U) (ν : E) (hg : ∀ x y, H (g x) (g y) = ν * H x y) (x : ⋀[E]^2 U) :
    L (map 2 (g : U →ₗ[E] U) x) =
      (ν ^ 2 / LinearMap.det (g : U →ₗ[E] U)) • map 2 (g : U →ₗ[E] U) (L x) := by
  sorry

end TauCetiRoadmap.HodgeClassesForJacquetLanglands
