import Mathlib

/-!
# Derived de Rham cohomology: headline statements

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here give Lean forms for headline results; proving them finishes neither a layer
nor the roadmap.

The statements on the pinned carriers are the p-basis theorem and the finiteness criterion for
differentials of a field of characteristic `p` (0.23), Bhatt's flatness and faithful
flatness criteria (1.10), the Ext calculation in the abelian category of complexes (1.20), canonical
divided powers on an augmentation ideal (PD.5), and the existence and regular-immersion presentation
of universal PD envelopes (PD.6). The definitions below express p-bases, the full PD universal
property, and the explicit relation ideal on Mathlib's divided-power algebra.

The following headline results need objects absent from the pins:

* The André–Quillen vanishing, complete-intersection and regularity criteria (0.19–0.22), and
  F-finite cotangent finiteness (0.24), need the full cotangent complex, its derived tensor and
  Tor-amplitude. Mathlib's two-term cotangent complex is only a truncation.
* Algebraization, effectivity, filtered completion, the Rees equivalence and the Beilinson heart
  (Layer 1) need derived module completion, compatible reduction systems and the filtered
  completion and tensor functors. A derived category alone does not provide these constructions.
* The ordinary de Rham universal property (2.21), Hodge graded pieces (2.24), derived Cartier and
  Frobenius-lift splitting (3.5, 3.10), rational collapse and smooth comparisons (3.12–3.13) need
  the ordinary de Rham complex, polynomial-resolution de Rham realization and derived powers.
* The PD conjugate graded map (4.2), quasisyntomic covers and descent (5.3–5.7, 5.17), and proper
  smooth perfectness and base change (5.23–5.24) need PD envelope functors with their filtrations,
  quasisyntomic sites, and affine and sheaf de Rham objects.
* The period descriptions and filtered embedding (5.12–5.15), and Teichmüller-quotient
  torsion-freeness (5.19), need the completed PD-envelope carrier A_cris and its period map and
  filtration. Mathlib has BDeRhamPlus, but no derived de Rham object to compare with it.
* The canonical logarithmic period comparison and Fontaine formula (6.20–6.21) need free-prelog
  resolutions, Gabber's log cotangent complex, log derived de Rham and its completed d log map.

These results have no substitute statements here. Their constructions and hypotheses are specified
in the README.
-/

namespace TauCetiRoadmap.DerivedDeRhamCohomology

open CategoryTheory

universe u v

namespace DerivedDeRham

/-- A family `b : Fin r → k` is a **p-basis** of a field `k` of characteristic `p`: the p-monomials
`∏ i, b i ^ e i` with `0 ≤ e i < p` form a basis of `k` over the subfield `k^p` of `p`-th powers.
A transcendence basis is in general not a p-basis (README 0.23). -/
def IsPBasis (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] {r : ℕ} (b : Fin r → k) :
    Prop :=
  LinearIndependent (frobenius k p).fieldRange
      (fun e : Fin r → Fin p => ∏ i, b i ^ (e i : ℕ)) ∧
    Submodule.span (frobenius k p).fieldRange
      (Set.range fun e : Fin r → Fin p => ∏ i, b i ^ (e i : ℕ)) = ⊤

/-- The differentials of a p-basis form a basis of `Ω¹_(k/F_p)`, so its dimension is
`log_p [k : k^p]` (Clausen–Mathew–Morrow, §5.1, Footnote 10, p.39;
Matsumura, Commutative ring theory, second edition, §26). This is `pBasis_kaehler_basis` of the
README (0.23). -/
theorem pBasis_kaehler_basis (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]
    [Algebra (ZMod p) k] {r : ℕ} (b : Fin r → k) (hb : IsPBasis p k b) :
    LinearIndependent k (fun i => KaehlerDifferential.D (ZMod p) k (b i)) ∧
      Submodule.span k (Set.range fun i => KaehlerDifferential.D (ZMod p) k (b i)) = ⊤ := by
  sorry

/-- **Finiteness criterion for differentials** (README 0.23): without assuming `[k : k^p]` finite,
`Ω¹_(k/F_p)` is finite-dimensional over `k` exactly when `k` is finite-dimensional over its subfield
`k^p` of `p`-th powers, and then `[k : k^p] = p ^ dim_k Ω¹_(k/F_p)` (Stacks, Lemma 15.47.2, Tag 07P2,
with base field `F_p`; Matsumura, Commutative ring theory, second edition, §26). -/
theorem kaehler_finiteDimensional_iff (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]
    [Algebra (ZMod p) k] :
    (FiniteDimensional k (KaehlerDifferential (ZMod p) k) ↔
        FiniteDimensional (frobenius k p).fieldRange k) ∧
      (FiniteDimensional (frobenius k p).fieldRange k →
        Module.finrank (frobenius k p).fieldRange k =
          p ^ Module.finrank k (KaehlerDifferential (ZMod p) k)) := by
  sorry

/-- **Bhatt's ordinary flatness criterion** (Bhatt, *On the direct summand conjecture and its
derived variant*, Proposition 5.1): over a Noetherian base, `π`-torsion-free and classically
`π`-adically complete algebras with flat reduction are flat. README 1.10. -/
theorem ordinaryFlatnessFromCompleteFlatness (A : Type u) (B : Type v)
    [CommRing A] [CommRing B] [Algebra A B] [IsNoetherianRing A] (π : A)
    (hπA : IsSMulRegular A π) (hπB : IsSMulRegular B (algebraMap A B π))
    (hA : IsAdicComplete (Ideal.span {π}) A) (hB : IsAdicComplete (Ideal.span {π}) B)
    (hflat : Module.Flat (A ⧸ Ideal.span {π})
      (B ⧸ Ideal.map (algebraMap A B) (Ideal.span {π}))) :
    Module.Flat A B := by
  sorry

/-- Faithful flatness of the reduction gives ordinary faithful flatness under the
Noetherian, torsion-free and completeness hypotheses of README 1.10. -/
theorem ordinaryFaithfulFlatnessFromCompleteFaithfulFlatness (A : Type u) (B : Type v)
    [CommRing A] [CommRing B] [Algebra A B] [IsNoetherianRing A] (π : A)
    (hπA : IsSMulRegular A π) (hπB : IsSMulRegular B (algebraMap A B π))
    (hA : IsAdicComplete (Ideal.span {π}) A) (hB : IsAdicComplete (Ideal.span {π}) B)
    (hflat : Module.FaithfullyFlat (A ⧸ Ideal.span {π})
      (B ⧸ Ideal.map (algebraMap A B) (Ideal.span {π}))) :
    Module.FaithfullyFlat A B := by
  sorry

section ComplexHeartExt

attribute [local instance] HasExt.standard

/-- BMS19, Proposition 5.6 (README 1.20): the full Ext formula in the abelian category of
cochain complexes. The target single complex represents `N[c]`, supported in degree `-c`. -/
theorem complexHeartExt (A : Type u) [CommRing A] (M N : ModuleCat.{u} A)
    (i : ℕ) (c : ℤ) :
    (c ≤ 0 → 0 ≤ (i : ℤ) + c →
      Nonempty (Abelian.Ext.{u + 1}
        ((CochainComplex.singleFunctor (ModuleCat.{u} A) 0).obj M)
        ((CochainComplex.singleFunctor (ModuleCat.{u} A) (-c)).obj N) i ≃+
        Abelian.Ext.{u + 1} M N (((i : ℤ) + c).toNat))) ∧
    ((0 < c ∨ (i : ℤ) + c < 0) →
      Subsingleton (Abelian.Ext.{u + 1}
        ((CochainComplex.singleFunctor (ModuleCat.{u} A) 0).obj M)
        ((CochainComplex.singleFunctor (ModuleCat.{u} A) (-c)).obj N) i)) := by
  sorry

end ComplexHeartExt

end DerivedDeRham

namespace PD

variable {A : Type*} [CommRing A] {I : Ideal A}

section CanonicalAugmentationPowers

variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- On the augmentation ideal of `Γ_R(M)`, the canonical PD structure is uniquely characterized
by `δ_n(dp₁ m) = dp_n m`, for an arbitrary module `M` (README PD.5; Stacks, Lemma 23.5.1 and
Remark 23.5.2 for free `M`; Roby 1963, Proposition IV.8, for the descent to a quotient). -/
theorem existsUnique_dividedPowers_augmentationIdeal :
    ∃! δ : DividedPowers (RingHom.ker (DividedPowerAlgebra.lift (dividedPowersBot R)
      (0 : M →ₗ[R] R) (fun _ ↦ by simp))),
      ∀ (n : ℕ) (m : M), δ.dpow n (DividedPowerAlgebra.dp R 1 m) =
        DividedPowerAlgebra.dp R n m := by
  sorry

end CanonicalAugmentationPowers

/-- `(D, J', δ)` with `ι : B → D` is a divided power envelope of `J ⊆ B` relative to `(A, I, γ)`:
`ι(J) ⊆ J'`, `A → D` is a divided power morphism, and every `A`-algebra map `B → C` sending `J` into
a divided power ideal `K` with a specified divided power morphism `(A, I, γ) → (C, K, ε)`
factors uniquely through a divided power morphism `D → C`. Since `isDPMorphism` includes
`I·D ⊆ J'`, the ideal `J'` contains `J·D + I·D`, and every test ideal `K` contains `I·C`; so `J` and
`J + I·B` have the same envelopes. -/
structure IsPDEnvelope {B D : Type u} [CommRing B] [CommRing D] [Algebra A B] [Algebra A D]
    (γ : DividedPowers I) (J : Ideal B) {J' : Ideal D} (δ : DividedPowers J') (ι : B →ₐ[A] D) :
    Prop where
  map_le : J.map ι ≤ J'
  isDPMorphism : DividedPowers.IsDPMorphism γ δ (algebraMap A D)
  universal : ∀ (C : Type u) [CommRing C] [Algebra A C] (K : Ideal C) (ε : DividedPowers K),
    DividedPowers.IsDPMorphism γ ε (algebraMap A C) → ∀ g : B →ₐ[A] C, J.map g ≤ K →
      ∃! h : D →ₐ[A] C, DividedPowers.IsDPMorphism δ ε h.toRingHom ∧ h.comp ι = g

/-- Existence of the universal divided power envelope of an arbitrary ideal `J`, with no
containment `I·B ⊆ J` (README PD.6; Stacks, Lemma 60.2.1 with its representability proof, and
Definition 60.2.2). -/
theorem exists_isPDEnvelope {B : Type u} [CommRing B] [Algebra A B] (γ : DividedPowers I)
    (J : Ideal B) :
    ∃ (D : Type u) (_ : CommRing D) (_ : Algebra A D) (J' : Ideal D) (δ : DividedPowers J')
      (ι : B →ₐ[A] D), IsPDEnvelope γ J δ ι := by
  sorry

/-- Relations `x_i - f_i` in the divided-power polynomial algebra on a finite family. -/
noncomputable def regularEnvelopeRelations {B : Type u} [CommRing B] {r : ℕ} (f : Fin r → B) :
    Ideal (DividedPowerAlgebra B (Fin r →₀ B)) :=
  Ideal.span (Set.range fun i => DividedPowerAlgebra.dp B 1 (Finsupp.single i 1) -
    algebraMap B (DividedPowerAlgebra B (Fin r →₀ B)) (f i))

/-- The regular-immersion presentation over an arbitrary PD base (README PD.6, condition (K)):
Koszul generation of relations modulo the base ideal makes the quotient by `x_i - f_i` the
universal envelope. In particular this applies to a regular sequence modulo the base ideal. -/
theorem regularImmersionEnvelope {B : Type u} [CommRing B] {I : Ideal B}
    (γ : DividedPowers I) {r : ℕ} (f : Fin r → B)
    (hrelations : ∀ c : Fin r → B, (∑ i, c i * f i) ∈ I →
      ∃ k ∈ Submodule.span B (Set.range fun ij : Fin r × Fin r =>
        f ij.2 • Pi.single ij.1 (1 : B) - f ij.1 • Pi.single ij.2 (1 : B)),
        ∀ i, c i - k i ∈ I) :
    let D := DividedPowerAlgebra B (Fin r →₀ B) ⧸ regularEnvelopeRelations f
    ∃ (K : Ideal D) (δ : DividedPowers K),
      IsPDEnvelope (A := B) (B := B) (D := D) γ (I ⊔ Ideal.span (Set.range f)) δ
        (Algebra.ofId B D) := by
  sorry

end PD

end TauCetiRoadmap.DerivedDeRhamCohomology
