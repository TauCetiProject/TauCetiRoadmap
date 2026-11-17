module

public import Mathlib
public import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic
public import TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower

/-!
# Locally analytic distributions, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable there, with `sorry`, together
with the two definitions they need: the first congruence subgroup of `SL₂(ℤ_p)` and the product of
`m` copies of it.

Stated here:

* the semisimplicity of finite-dimensional modules over the rational Iwasawa algebra
  `ℚ_p ⊗ ℤ_p[[G₁^m]]` (Ardakov–Wadsley 2013, Theorem 11.1(a); README §3.8), for `p` odd;
* the algebraic Peter–Weyl theorem `K[[G₁^m]]/Ann(W_k) ≅ End_K(W_k)` for
  `W_k = ⊠_i Sym^{k_i}(K²)` (Fu, §6, (32); README §5.2 (iii)), for `p` odd, as the existence of a
  surjective `K`-algebra map from `K ⊗_{ℤ_p} ℤ_p[[G₁^m]]` to `End_K(W_k)` through which each group
  element acts by the algebraic representation; its kernel is the annihilator `Ann(W_k)`.

Not statable at the pins, with the carrier each one lacks:

* Fu's injectivity theorem (Fu, Theorem 1.5; README §4.14), that `ℚ_p[[G₁^m]] → Û(g)_λ` is
  injective for every `λ ∈ ℤ_p^m`. It needs the `p`-adic completion `Û(g_{ℤ_p})` of the
  noncommutative ring `U(sl₂(ℤ_p)^m)` as a ring (Mathlib's `AdicCompletion` is a ring only for the
  completion of a commutative ring at an ideal of itself), and the microlocalisation homomorphism
  `ℚ_p[[G]] → Û(g)_{ℚ_p}`, the continuous extension of `g ↦ exp(log g)`, whose existence is itself
  the Ardakov–Wadsley theorem.
* The Ardakov–Wadsley microlocalisation theorem `Q_{gr p}(R[[G]]) ≅ Û(g_R)_K` (README §3.4) and
  the identification `D_{1/p}(G, K) ≅ Û(g_R)_K` (README §3.5): they need the algebraic
  microlocalisation of a filtered ring, `Û(g_R)` as a ring, and the locally analytic distribution
  algebra `D(G, K)` with its Banach steps, none of which exists at the pins.
* The faithfulness of affinoid Verma modules over Iwasawa algebras (Ardakov–Wadsley 2014,
  Theorem 5.4; README §4.13): it needs the affinoid enveloping algebras `Û(p^n 𝔤)_K`, affinoid
  Verma modules and the action of `K[[G]]` through the microlocalisation.
* Frommer's theorem and the crossed-product decomposition `D_{r_n} = U_{r_n} ∗ (G/G^{p^n})`
  (README §§2.3–2.4), and the domain and normal-form theorems for central quotients
  (README §§4.7–4.10): they need the Banach steps `D_r(G, K)` of the distribution algebra.
* Fu's comparison of isotypic quotients `M_W ≅ M̂_W` (Fu, Theorem 4.3; README §3.10): it needs the
  microlocalisation `M̂ = Û(g_K) ⊗_{K[[G]]} M`.
* Strong duality after central specialisation, `D(G, K)_λ ≅ C^la(G, K)[λ ∘ S]′_b` for a
  `K`-algebra character `λ` of the centre `Z(U(g_K))` of `U(g_K)`, the quotient being taken over
  that centre, with `S` the antipode of `U(g_K)` (Fu, Theorem 5.2; README §4.3): it needs the
  space of locally analytic functions with its compact-type topology and its strong dual.
* The Fréchet–Stein property of the Arens–Michael envelope `𝒰(g)` (README §2.5): it needs
  Fréchet–Stein algebras and the completions `U(g)_r`.
-/

@[expose] public section

open TensorProduct

namespace TauCetiRoadmap.LocallyAnalyticDistributionsPartII

/-! ## Layer 0: Lazard lattices and first congruence subgroups -/

/-- The first congruence subgroup `G₁ = ker(SL₂(ℤ_p) → SL₂(ℤ/p))`, the kernel of reduction
modulo `p`; equivalently `SL₂(ℤ_p) ∩ (I₂ + p M₂(ℤ_p))` (Fu, §1, before Theorem 1.4). -/
noncomputable def firstCongruenceSL2 (p : ℕ) [Fact p.Prime] :
    Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]) :=
  (Matrix.SpecialLinearGroup.map (PadicInt.toZMod (p := p))).ker

/-- The product `G₁^m` of `m` first congruence subgroups, as the subgroup of
`Fin m → SL₂(ℤ_p)` whose every coordinate lies in `G₁` (Fu, §1, before Theorem 1.4). -/
noncomputable def firstCongruenceProduct (p : ℕ) [Fact p.Prime] (m : ℕ) :
    Subgroup (Fin m → Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]) :=
  Subgroup.pi Set.univ fun _ => firstCongruenceSL2 p

/-! ## Layer 3: Microlocalisation of Iwasawa algebras and Lie modules -/

/-- **Semisimplicity of finite-dimensional Iwasawa modules** (Ardakov–Wadsley 2013, §11.1,
Theorem (a)). For `p` odd and `G = G₁^m`, a congruence kernel of the split semisimple group
`SL₂^m` over `ℤ_p`, every module over the rational Iwasawa algebra `ℚ_p ⊗_{ℤ_p} ℤ_p[[G]]` that is
finite-dimensional over `ℚ_p` (the scalars acting through the algebra) is semisimple. The modules
are abstract modules, with no continuity hypothesis. -/
theorem isSemisimpleModule_of_finiteDimensional (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (m : ℕ)
    (M : Type*) [AddCommGroup M]
    [Module (ℚ_[p] ⊗[ℤ_[p]] TauCeti.completedGroupAlgebra ℤ_[p] (firstCongruenceProduct p m)) M]
    [Module ℚ_[p] M]
    [IsScalarTower ℚ_[p]
      (ℚ_[p] ⊗[ℤ_[p]] TauCeti.completedGroupAlgebra ℤ_[p] (firstCongruenceProduct p m)) M]
    [FiniteDimensional ℚ_[p] M] :
    IsSemisimpleModule
      (ℚ_[p] ⊗[ℤ_[p]] TauCeti.completedGroupAlgebra ℤ_[p] (firstCongruenceProduct p m)) M := by
  sorry

/-! ## Layer 5: Algebraic functions and the algebraic Peter–Weyl theorem -/

/-- **The algebraic Peter–Weyl theorem on `G₁^m`** (Fu, §6, (32); Ardakov–Wadsley 2013, §11.3).
For `p` odd, `K/ℚ_p` finite, `G = G₁^m` and `k ∈ ℕ^m`, let `W_k = ⊠_i Sym^{k_i}(K²)` with
`g ∈ G` acting by `⊗_i Sym^{k_i}(g_i)`. There is a `K`-algebra map
`Φ : K ⊗_{ℤ_p} ℤ_p[[G]] → End_K(W_k)` through which every group element acts by this algebraic
representation, and `Φ` is surjective; so `K[[G]]/ker Φ ≅ End_K(W_k)`, where `ker Φ` is the
annihilator of `W_k`, and the maximal `W_k`-quotient of `K[[G]]` has dimension `(Π_i (k_i + 1))²`.
For `m = 0` it says `K ≅ End_K(K)`. -/
theorem exists_surjective_algHom_end_symPower (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (m : ℕ) (k : Fin m → ℕ)
    (K : Type) [Field K] [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [Algebra ℤ_[p] K] [IsScalarTower ℤ_[p] ℚ_[p] K] :
    ∃ Φ : (K ⊗[ℤ_[p]] TauCeti.completedGroupAlgebra ℤ_[p] (firstCongruenceProduct p m)) →ₐ[K]
        Module.End K (⨂[K] i : Fin m, Sym[K]^(k i) (Fin 2 → K)),
      (∀ g : firstCongruenceProduct p m,
        Φ (1 ⊗ₜ[ℤ_[p]] TauCeti.completedGroupAlgebra.of ℤ_[p] (firstCongruenceProduct p m) g) =
          PiTensorProduct.map fun i => TauCeti.symPowerRep K 2 (k i)
            (Matrix.SpecialLinearGroup.toGL
              (Matrix.SpecialLinearGroup.map (algebraMap ℤ_[p] K) (g.val i)))) ∧
      Function.Surjective Φ := by
  sorry

end TauCetiRoadmap.LocallyAnalyticDistributionsPartII
