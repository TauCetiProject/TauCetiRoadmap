module

import Mathlib
import TauCeti.RingTheory.Huber.Basic
import TauCeti.RingTheory.Perfectoid.Integral
import TauCeti.RingTheory.Valuation.Continuous.Basic
import TauCeti.RingTheory.Syntomic.StandardSyntomic

/-!
# Perfectoid quotients, Part II: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need; the README's other targets, API lists and Checks stay in the README.

*Integral perfectoid* is Tau Ceti's `TauCeti.Perfectoid.IsIntegralPerfectoid` (BMS1
Definition 3.5), whose instance
`TauCeti.Perfectoid.IsIntegralPerfectoid.isAdicComplete_span_natCast` supplies the `p`-adic
completeness that Mathlib's `PreTilt.untilt` and `WittVector.fontaineTheta` need. `IsSyntomic` is
Stacks' description of a syntomic ring map as one that is standard syntomic
(Tau Ceti `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`) Zariski locally on the source,
`IsIndSyntomic` is the factorization form of ind-syntomic maps and `IsPZariski` the `p`-Zariski
condition.

Stated: fibre products of perfectoid rings (Česnavičius–Scholze Proposition 2.1.4); the transfer of
adic completeness, of the valuation-ring property with its value group, and of algebraic closedness
of the fraction field along tilting (Proposition 2.1.9); torsion-free perfectoid presentations
(Proposition 2.1.12); the integral approximation lemma (Lemma 2.3.1); the valuative criterion for
topological nilpotence in a Tate ring (Lemma 2.3.2); the ind-syntomic André lemma (Theorem 2.3.4);
semiperfectoid covers of `p`-Zariski rings (Corollary 2.3.7); perfectoid faithfully flat covers of
regular local rings (Bhatt–Scholze Remark 3.11 and Bhatt, Proposition 5.2, in mixed
characteristic; the perfection in equal characteristic `p`), and, for an `F`-finite residue field,
such a cover inside the completion of the absolute integral closure `R⁺` (Bhatt–Scholze
Remarks 3.11 and 10.13); and the almost vanishing of `Tor` along finite subextensions of `R⁺` for a
complete regular local ring, given a faithfully flat perfectoid cover mapping to the completion of
`R⁺`, and unconditionally for an `F`-finite residue field, the generality of Heitmann–Ma
Theorem 1.3 (Bhatt–Scholze Remark 10.13).

Not statable at the pins:

* the relative tilting equivalence itself (Česnavičius–Scholze Proposition 2.1.9, first assertion):
  it needs the tilt `A' ↦ A'♭` as a functor on the category of integral perfectoid `A`-algebras
  and the category of complete perfect `A♭`-algebras, neither of which exists at the pins.
-/

namespace TauCetiRoadmap.PerfectoidQuotientsPartII

open TauCeti.Perfectoid (IsIntegralPerfectoid)

universe u v

/-! ## Standing definitions -/

section Definitions

variable (p : ℕ) [Fact p.Prime]

/-- A ring map `R → S` is *syntomic* if `S` is covered by finitely many principal opens `D(g)` on
which `S_g` is a standard syntomic `R`-algebra (Stacks, Lemmas 10.136.4 and 10.136.15, tags 00SO
and 00SY); the relative dimension may vary with `g`. -/
def IsSyntomic (R S : Type*) [CommRing R] [CommRing S] [Algebra R S] : Prop :=
  ∃ s : Finset S, Ideal.span (s : Set S) = ⊤ ∧
    ∀ g ∈ s, ∃ n : ℕ, TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension n R (Localization.Away g)

/-- A ring map `R → S` is *ind-syntomic* if every `R`-algebra map from a finitely presented
`R`-algebra to `S` factors through a syntomic `R`-algebra (Česnavičius–Scholze §2.3.3, p. 24;
equivalently, by Stacks Lemma 10.127.4, tag 07C3, `S` is a filtered colimit of syntomic
`R`-algebras). -/
def IsIndSyntomic (R S : Type u) [CommRing R] [CommRing S] [Algebra R S] : Prop :=
  ∀ (B : Type u) [CommRing B] [Algebra R B], Algebra.FinitePresentation R B →
    ∀ f : B →ₐ[R] S, ∃ (T : Type u) (_ : CommRing T) (_ : Algebra R T), IsSyntomic R T ∧
      ∃ (g : B →ₐ[R] T) (h : T →ₐ[R] S), h.comp g = f

/-- A ring `A` is *`p`-Zariski* if `1 + pA ⊆ Aˣ`, equivalently if `p` lies in the Jacobson radical
of `A` (Česnavičius–Scholze Corollary 2.3.7, p. 28). -/
def IsPZariski (A : Type*) [CommRing A] : Prop :=
  ∀ a : A, IsUnit (1 + (p : A) * a)

end Definitions

/-! ## Layer Q5: Tilting identities, torsion transfer and fibre products -/

section FibreProducts

variable (p : ℕ) [Fact p.Prime]

/-- **Fibre products of perfectoid rings** (Česnavičius–Scholze Proposition 2.1.4, p. 12). For a
surjection `f : A ↠ A'` of integral perfectoid rings and any map `g : B → A'` from an integral
perfectoid ring, the fibre product `A ×_{A'} B`, the subring of `A × B` where `f` and `g` agree, is
integral perfectoid. -/
theorem isIntegralPerfectoid_fibreProduct {A A' B : Type*} [CommRing A] [CommRing A'] [CommRing B]
    [IsIntegralPerfectoid p A] [IsIntegralPerfectoid p A'] [IsIntegralPerfectoid p B]
    (f : A →+* A') (hf : Function.Surjective f) (g : B →+* A') :
    IsIntegralPerfectoid p ((f.comp (RingHom.fst A B)).eqLocus (g.comp (RingHom.snd A B))) :=
  sorry

end FibreProducts

/-! ## Layer Q6: The relative tilting equivalence, valuation rings and torsion-free presentations -/

section Tilting

variable (p : ℕ) [Fact p.Prime]

/-- **Adic completeness transfers along tilting** (Česnavičius–Scholze Proposition 2.1.9, p. 14).
Let `A'` be a nonzero integral perfectoid ring, `ξ` a generator of the kernel of
`θ : W(A'♭) → A'` and `ϖ♭ ∈ A'♭` a divisor of its zeroth Witt coordinate. Then `A'♭` is
`ϖ♭`-adically complete if and only if `A'` is `(ϖ♭)♯`-adically complete. -/
theorem isAdicComplete_preTilt_iff (A' : Type*) [CommRing A'] [IsIntegralPerfectoid p A']
    [Fact (¬ IsUnit (p : A'))]
    (ξ : WittVector p (PreTilt A' p))
    (hξ : RingHom.ker (WittVector.fontaineTheta A' p) = Ideal.span {ξ})
    (ϖ : PreTilt A' p) (hϖ : ϖ ∣ ξ.coeff 0) :
    IsAdicComplete (Ideal.span {ϖ}) (PreTilt A' p) ↔
      IsAdicComplete (Ideal.span {PreTilt.untilt ϖ}) A' :=
  sorry

/-- **Valuation rings under tilting** (Česnavičius–Scholze Proposition 2.1.9, p. 14). A nonzero
integral perfectoid ring is a valuation ring if and only if its tilt is. -/
theorem valuationRing_iff_preTilt (A : Type*) [CommRing A] [IsIntegralPerfectoid p A]
    [Fact (¬ IsUnit (p : A))] :
    (∃ _ : IsDomain A, ValuationRing A) ↔
      (∃ _ : IsDomain (PreTilt A p), ValuationRing (PreTilt A p)) :=
  sorry

/-- **The value groups agree** (Česnavičius–Scholze Proposition 2.1.9, pp. 14–15). For an integral
perfectoid valuation ring `A`, divisibility in `A♭` is detected after `x ↦ x♯`, and every element
of `A` is a unit multiple of a sharp. Together these say that `x ↦ x♯` induces an order-preserving
isomorphism `Frac(A♭)ˣ/(A♭)ˣ ≃ Frac(A)ˣ/Aˣ`. -/
theorem untilt_dvd_iff_and_exists_isUnit_mul_untilt (A : Type*) [CommRing A] [IsDomain A]
    [ValuationRing A] [IsIntegralPerfectoid p A] [Fact (¬ IsUnit (p : A))] :
    (∀ x y : PreTilt A p, x ∣ y ↔ PreTilt.untilt x ∣ PreTilt.untilt y) ∧
      ∀ a : A, ∃ u : A, IsUnit u ∧ ∃ b : PreTilt A p, a = u * PreTilt.untilt b :=
  sorry

/-- **Algebraically closed fraction fields under tilting** (Česnavičius–Scholze Proposition 2.1.9,
p. 14). An integral perfectoid valuation ring has algebraically closed fraction field if and only
if its tilt does. -/
theorem isAlgClosed_fractionRing_iff (A : Type*) [CommRing A] [IsDomain A] [ValuationRing A]
    [IsIntegralPerfectoid p A] [Fact (¬ IsUnit (p : A))] [IsDomain (PreTilt A p)] :
    IsAlgClosed (FractionRing A) ↔ IsAlgClosed (FractionRing (PreTilt A p)) :=
  sorry

/-- **Torsion-free perfectoid presentations** (Česnavičius–Scholze Proposition 2.1.12, p. 17).
Every integral perfectoid ring `A` that is `ϖ`-adically complete for some `ϖ` with `ϖ ^ p ∣ p` is a
quotient of an integral perfectoid ring `Ã` that is `ϖ̃`-torsion-free and `ϖ̃`-adically complete
for a lift `ϖ̃` of `ϖ` with `ϖ̃ ^ p ∣ p`. -/
theorem exists_surjective_of_isSMulRegular (A : Type u) [CommRing A] [IsIntegralPerfectoid p A]
    (ϖ : A) (hϖ : ϖ ^ p ∣ (p : A)) (hc : IsAdicComplete (Ideal.span {ϖ}) A) :
    ∃ (Ã : Type u) (_ : CommRing Ã) (ϖ' : Ã) (f : Ã →+* A), IsIntegralPerfectoid p Ã ∧
      ϖ' ^ p ∣ (p : Ã) ∧ IsSMulRegular Ã ϖ' ∧ IsAdicComplete (Ideal.span {ϖ'}) Ã ∧
      Function.Surjective f ∧ f ϖ' = ϖ :=
  sorry

/-- **Torsion-free presentations with compatible roots** (README Q6.8, second theorem; made explicit
in the proof of Česnavičius–Scholze Proposition 2.1.12, pp. 17–18, and used in the proof of
Theorem 2.3.4, p. 25). If moreover `ϖ` has a compatible system of `p`-power roots, the
presentation can be chosen so that `ϖ̃` has a compatible system of `p`-power roots lifting the given
one. -/
theorem exists_surjective_of_isSMulRegular_of_roots (A : Type u) [CommRing A]
    [IsIntegralPerfectoid p A] (ϖ : A) (hϖ : ϖ ^ p ∣ (p : A))
    (hc : IsAdicComplete (Ideal.span {ϖ}) A) (r : ℕ → A) (hr₀ : r 0 = ϖ)
    (hr : ∀ n, r (n + 1) ^ p = r n) :
    ∃ (Ã : Type u) (_ : CommRing Ã) (r' : ℕ → Ã) (f : Ã →+* A), IsIntegralPerfectoid p Ã ∧
      r' 0 ^ p ∣ (p : Ã) ∧ IsSMulRegular Ã (r' 0) ∧ IsAdicComplete (Ideal.span {r' 0}) Ã ∧
      (∀ n, r' (n + 1) ^ p = r' n) ∧ Function.Surjective f ∧ ∀ n, f (r' n) = r n :=
  sorry

/-- **Perfectoid rings are quotients of `p`-torsion-free ones** (Česnavičius–Scholze
Proposition 2.1.12, second assertion, p. 17). -/
theorem exists_surjective_of_isSMulRegular_p (A : Type u) [CommRing A]
    [IsIntegralPerfectoid p A] :
    ∃ (Ã : Type u) (_ : CommRing Ã) (f : Ã →+* A), IsIntegralPerfectoid p Ã ∧
      IsSMulRegular Ã (p : Ã) ∧ Function.Surjective f :=
  sorry

end Tilting

/-! ## Layer Q8: Continuous valuations: tilting, approximation and topological nilpotence -/

section Valuations

variable (p : ℕ) [Fact p.Prime]

/-- **The integral approximation lemma** (Česnavičius–Scholze Lemma 2.3.1, pp. 22–23). Let `A`
be integral perfectoid with the `ϖ`-adic topology, where `ϖ ^ p ∣ p` and `A` is `ϖ`-adically
complete, and let `a ∈ A` and `m ≥ 0`. There is `a' ∈ A♭` such that every continuous valuation
`v` on `A` with `v ≤ 1` on `A` satisfies `v(a - a'♯) ≤ v(p) · max(v(a'♯), v(ϖ) ^ (p m))`. -/
theorem exists_approximation (A : Type u) [CommRing A] [TopologicalSpace A]
    [IsIntegralPerfectoid p A] [Fact (¬ IsUnit (p : A))]
    (ϖ : A) (hϖ : ϖ ^ p ∣ (p : A)) (hadic : IsAdic (Ideal.span {ϖ}))
    (hc : IsAdicComplete (Ideal.span {ϖ}) A) (a : A) (m : ℕ) :
    ∃ a' : PreTilt A p, ∀ (Γ₀ : Type v) [LinearOrderedCommGroupWithZero Γ₀]
      (v : Valuation A Γ₀), v.IsContinuous → (∀ x, v x ≤ 1) →
      v (a - PreTilt.untilt a') ≤ v p * max (v (PreTilt.untilt a')) (v ϖ ^ (p * m)) :=
  sorry

/-- **Topological nilpotence is detected by continuous valuations** (Česnavičius–Scholze
Lemma 2.3.2, p. 24, in its Tate-ring form; README Q8.4). In a Tate ring `R`
with a pair of definition `(A₀, I)`, an element is topologically nilpotent if and only if `v(a) < 1`
for every continuous valuation `v` on `R` with `v ≤ 1` on `A₀`. -/
theorem isTopologicallyNilpotent_iff_forall_lt_one (R : Type u) [CommRing R] [TopologicalSpace R]
    [IsTopologicalRing R] [TauCeti.Huber.IsTateRing R] (P : TauCeti.Huber.PairOfDefinition R)
    (a : R) :
    IsTopologicallyNilpotent a ↔
      ∀ (Γ₀ : Type v) [LinearOrderedCommGroupWithZero Γ₀] (v : Valuation R Γ₀),
        v.IsContinuous → (∀ x ∈ P.ringOfDefinition, v x ≤ 1) → v a < 1 :=
  sorry

end Valuations

/-! ## Layer Q9: The ind-syntomic André lemma and semiperfectoid covers -/

section Andre

variable (p : ℕ) [Fact p.Prime]

/-- **The ind-syntomic André lemma** (Česnavičius–Scholze Theorem 2.3.4, p. 25). Let `ϖ ∈ A`
satisfy `ϖ ^ p ∣ p` and have compatible `p`-power roots, and suppose that either `A` is integral
perfectoid and `ϖ`-adically complete, or `A` is `ϖ`-Henselian, `ϖ` is a nonzerodivisor and the
`ϖ`-adic completion of `A` is integral perfectoid. Then there are a faithfully flat, ind-syntomic,
`ϖ`-Henselian `A`-algebra `A'` with integral perfectoid `ϖ`-adic completion and a `ϖ`-divisible
ideal `I' ⊆ A'` with `A'/I'` faithfully flat over `A`, such that every monic polynomial of positive
degree over `A'` has a root in `A'/I'` with compatible `p`-power roots. -/
theorem exists_indSyntomic_andre (A : Type u) [CommRing A] (ϖ : A) (hϖ : ϖ ^ p ∣ (p : A))
    (r : ℕ → A) (hr₀ : r 0 = ϖ) (hr : ∀ n, r (n + 1) ^ p = r n)
    (hA : (IsIntegralPerfectoid p A ∧ IsAdicComplete (Ideal.span {ϖ}) A) ∨
      (HenselianRing A (Ideal.span {ϖ}) ∧ IsSMulRegular A ϖ ∧
        IsIntegralPerfectoid p (AdicCompletion (Ideal.span {ϖ}) A))) :
    ∃ (A' : Type u) (_ : CommRing A') (_ : Algebra A A'),
      Module.FaithfullyFlat A A' ∧ IsIndSyntomic A A' ∧
      HenselianRing A' (Ideal.span {algebraMap A A' ϖ}) ∧
      IsIntegralPerfectoid p (AdicCompletion (Ideal.span {algebraMap A A' ϖ}) A') ∧
      ∃ I : Ideal A', (∀ x ∈ I, ∃ y ∈ I, x = algebraMap A A' ϖ * y) ∧
        Module.FaithfullyFlat A (A' ⧸ I) ∧
        ∀ P : Polynomial A', P.Monic → 0 < P.natDegree →
          ∃ α : ℕ → A' ⧸ I, (P.map (Ideal.Quotient.mk I)).IsRoot (α 0) ∧
            ∀ n, α (n + 1) ^ p = α n :=
  sorry

/-- **Semiperfectoid covers of `p`-Zariski rings** (Česnavičius–Scholze Corollary 2.3.7, p. 28).
Every `p`-Zariski ring `A` has a faithfully flat `A`-algebra `A'` (the README's `A_∞`) such that the
`p`-adic completion of `A'_red` is integral perfectoid and `A'` is a quotient of a `p`-torsion-free,
`p`-Henselian ring `Ã` with integral perfectoid `p`-adic completion in which every monic polynomial
of positive degree has a root. -/
theorem exists_semiperfectoid_cover (A : Type u) [CommRing A] (hA : IsPZariski p A) :
    ∃ (A' : Type u) (_ : CommRing A') (_ : Algebra A A'), Module.FaithfullyFlat A A' ∧
      IsIntegralPerfectoid p (AdicCompletion (Ideal.span {(p : A' ⧸ nilradical A')})
        (A' ⧸ nilradical A')) ∧
      ∃ (Ã : Type u) (_ : CommRing Ã) (π : Ã →+* A'), Function.Surjective π ∧
        IsSMulRegular Ã (p : Ã) ∧ HenselianRing Ã (Ideal.span {(p : Ã)}) ∧
        IsIntegralPerfectoid p (AdicCompletion (Ideal.span {(p : Ã)}) Ã) ∧
        ∀ P : Polynomial Ã, P.Monic → 0 < P.natDegree → ∃ x, P.IsRoot x :=
  sorry

end Andre

/-! ## Layer Q10: Regular local rings: prismatic covers and almost vanishing of `Tor` -/

section RegularLocal

variable (p : ℕ) [Fact p.Prime]

open IsLocalRing CategoryTheory

/-- **Perfectoid faithfully flat covers of regular local rings** (Bhatt–Scholze Remark 3.11,
pp. 32–33, for complete rings of mixed characteristic; Bhatt, Proposition 5.2 with modification (a)
of the paragraph after its statement, p. 8, for `p`-torsion-free rings; the perfection, faithfully
flat by Kunz's theorem, in characteristic `p`). Every regular local ring whose maximal ideal
contains `p` admits a faithfully flat map to an integral perfectoid ring (README Q10.2). -/
theorem exists_faithfullyFlat_isIntegralPerfectoid (R : Type u) [CommRing R]
    [IsRegularLocalRing R] (hp : (p : R) ∈ maximalIdeal R) :
    ∃ (R' : Type u) (_ : CommRing R') (_ : Algebra R R'),
      Module.FaithfullyFlat R R' ∧ IsIntegralPerfectoid p R' :=
  sorry

/-- **A perfectoid cover inside the completed absolute integral closure** (Bhatt–Scholze
Remark 3.11, pp. 32–33, and Remark 10.13, p. 83; README Q10.4). Let `R` be a complete regular local
ring of characteristic zero whose residue field `k` has characteristic `p` and is `F`-finite (a
finite module over its subfield of `p`-th powers, the field range of `frobenius k p`), and `R⁺` its
integral closure in an algebraic closure of its fraction field. Then `R` admits a faithfully flat
map `R → R∞` to an integral perfectoid ring together with an injective `R`-algebra map from `R∞` to
the `p`-adic completion `(R⁺)^∧`. -/
theorem exists_faithfullyFlat_isIntegralPerfectoid_injective_completion (R : Type u) [CommRing R]
    [IsDomain R] [IsRegularLocalRing R] [IsAdicComplete (maximalIdeal R) R] [CharZero R]
    [CharP (ResidueField R) p]
    [Module.Finite (frobenius (ResidueField R) p).fieldRange (ResidueField R)] :
    ∃ (R' : Type u) (_ : CommRing R') (_ : Algebra R R'),
      Module.FaithfullyFlat R R' ∧ IsIntegralPerfectoid p R' ∧
      ∃ φ : R' →ₐ[R] AdicCompletion
          (Ideal.span {(p : integralClosure R (AlgebraicClosure (FractionRing R)))})
          (integralClosure R (AlgebraicClosure (FractionRing R))),
        Function.Injective φ :=
  sorry

/-- **Almost vanishing of `Tor` along finite subextensions of `R⁺`, given a cover inside `(R⁺)^∧`**
(Bhatt–Scholze Remark 10.13, pp. 83–84; README Q10.5). Let `R` be a complete regular local ring of
characteristic zero with residue field of characteristic `p`, `R⁺` its integral closure in an
algebraic closure of its fraction field, `S ⊆ R⁺` a finite `R`-subalgebra and `c ∈ pR` with
`R[1/c] → S[1/c]` finite étale, and suppose given a faithfully flat map `R → R∞` to an integral
perfectoid ring with an `R`-algebra map `R∞ → (R⁺)^∧`. For `n > 0`, `i > 0`, every `R/pⁿ`-module `N`
and every compatible system `(cₖ)` of `p`-power roots of `c` in `R⁺`, the map
`Tor_i^{R/pⁿ}(S/pⁿ, N) → Tor_i^{R/pⁿ}(R⁺/pⁿ, N)` followed by multiplication by `cₖ` is zero. -/
theorem tor_map_mul_root_eq_zero_of_cover (R : Type u) [CommRing R] [IsDomain R]
    [IsRegularLocalRing R] [IsAdicComplete (maximalIdeal R) R] [CharZero R]
    [CharP (ResidueField R) p]
    (R' : Type u) [CommRing R'] [Algebra R R'] [Module.FaithfullyFlat R R']
    [IsIntegralPerfectoid p R']
    (φ : R' →ₐ[R] AdicCompletion
      (Ideal.span {(p : integralClosure R (AlgebraicClosure (FractionRing R)))})
      (integralClosure R (AlgebraicClosure (FractionRing R))))
    (S : Subalgebra R (AlgebraicClosure (FractionRing R)))
    (hS : S ≤ integralClosure R (AlgebraicClosure (FractionRing R))) [Module.Finite R S]
    (c : R) (hc : c ∈ Ideal.span {(p : R)})
    [Algebra.Etale (Localization.Away c)
      (Localization (Algebra.algebraMapSubmonoid S (Submonoid.powers c)))]
    [Module.Finite (Localization.Away c)
      (Localization (Algebra.algebraMapSubmonoid S (Submonoid.powers c)))]
    (cr : ℕ → integralClosure R (AlgebraicClosure (FractionRing R)))
    (hcr₀ : cr 0 = algebraMap R _ c) (hcr : ∀ k, cr (k + 1) ^ p = cr k)
    (n : ℕ) (hn : 0 < n) (i : ℕ) (hi : 0 < i)
    (N : ModuleCat.{u} (R ⧸ Ideal.span {(p : R) ^ n})) (k : ℕ) :
    ((Tor (ModuleCat.{u} (R ⧸ Ideal.span {(p : R) ^ n})) i).map
      (ModuleCat.ofHom ((LinearMap.mulLeft (R ⧸ Ideal.span {(p : R) ^ n})
          ((1 : R ⧸ Ideal.span {(p : R) ^ n}) ⊗ₜ[R] cr k)).comp
        ((Subalgebra.inclusion hS).toLinearMap.baseChange
          (R ⧸ Ideal.span {(p : R) ^ n}))))).app N = 0 :=
  sorry

/-- **Almost vanishing of `Tor` for an `F`-finite residue field** (Bhatt–Scholze Remark 10.13,
pp. 83–84, in the generality of Heitmann–Ma Theorem 1.3; README Q10.6). Let `R` be a complete
regular local ring of characteristic zero whose residue field `k` has characteristic `p` and is
`F`-finite (a finite module over its subfield of `p`-th powers, the field range of `frobenius k p`),
`R⁺` its integral
closure in an algebraic closure of its fraction field, `S ⊆ R⁺` a finite `R`-subalgebra and
`c ∈ pR` with `R[1/c] → S[1/c]` finite étale. For `n > 0`, `i > 0`, every `R/pⁿ`-module `N` and
every compatible system `(cₖ)` of `p`-power roots of `c` in `R⁺`, the map
`Tor_i^{R/pⁿ}(S/pⁿ, N) → Tor_i^{R/pⁿ}(R⁺/pⁿ, N)` followed by multiplication by `cₖ` is zero. -/
theorem tor_map_mul_root_eq_zero (R : Type u) [CommRing R] [IsDomain R] [IsRegularLocalRing R]
    [IsAdicComplete (maximalIdeal R) R] [CharZero R] [CharP (ResidueField R) p]
    [Module.Finite (frobenius (ResidueField R) p).fieldRange (ResidueField R)]
    (S : Subalgebra R (AlgebraicClosure (FractionRing R)))
    (hS : S ≤ integralClosure R (AlgebraicClosure (FractionRing R))) [Module.Finite R S]
    (c : R) (hc : c ∈ Ideal.span {(p : R)})
    [Algebra.Etale (Localization.Away c)
      (Localization (Algebra.algebraMapSubmonoid S (Submonoid.powers c)))]
    [Module.Finite (Localization.Away c)
      (Localization (Algebra.algebraMapSubmonoid S (Submonoid.powers c)))]
    (cr : ℕ → integralClosure R (AlgebraicClosure (FractionRing R)))
    (hcr₀ : cr 0 = algebraMap R _ c) (hcr : ∀ k, cr (k + 1) ^ p = cr k)
    (n : ℕ) (hn : 0 < n) (i : ℕ) (hi : 0 < i)
    (N : ModuleCat.{u} (R ⧸ Ideal.span {(p : R) ^ n})) (k : ℕ) :
    ((Tor (ModuleCat.{u} (R ⧸ Ideal.span {(p : R) ^ n})) i).map
      (ModuleCat.ofHom ((LinearMap.mulLeft (R ⧸ Ideal.span {(p : R) ^ n})
          ((1 : R ⧸ Ideal.span {(p : R) ^ n}) ⊗ₜ[R] cr k)).comp
        ((Subalgebra.inclusion hS).toLinearMap.baseChange
          (R ⧸ Ideal.span {(p : R) ^ n}))))).app N = 0 :=
  sorry

end RegularLocal

end TauCetiRoadmap.PerfectoidQuotientsPartII
