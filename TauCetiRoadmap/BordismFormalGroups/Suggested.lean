module

public import Mathlib
public import TauCeti.RingTheory.FormalGroup.Hom
public import TauCeti.RingTheory.FormalGroup.Height.Basic
public import TauCeti.RingTheory.FormalGroup.Height.Ideal
public import TauCeti.RingTheory.FormalGroup.LazardRing.Basic
public import TauCeti.RingTheory.FormalGroup.CoordinateChange.Lazard

/-!
# Bordism, formal groups and chromatic operations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`.

Statable at the pins, and stated below: Lazard's classification of
one-dimensional commutative formal groups over a separably closed field of
characteristic `p` by their height (F1), on Tau Ceti's bundled isomorphisms
`TauCeti.FormalGroupIso` and height `FormalGroup.height`; Landweber's
classification of the homogeneous invariant prime ideals of the Lazard ring
(F5), on Tau Ceti's `TauCeti.LazardRing` with its grading, its Hopf
algebroid of strict coordinate changes and the height ideals
`FormalGroup.heightIdeal`; and the Lubin–Tate universal deformation theorem
(F5), on Mathlib's `MvPowerSeries`, complete Noetherian local rings and
`FormalGroup.map`. The rest of F1 (the `n`-series, the Lazard ring with its
universality and polynomial theorem, the symmetric cocycle lemma, the
coordinate-change Hopf algebroid with the invariance of the height ideals,
the invariant differential, logarithm and exponential, the exponent-two
normalized logarithm and its universal ring) consists of theorems of the
pinned Tau Ceti, consumed by the README and stated nowhere here; so does the
uniqueness of the ⋆-isomorphism in the Lubin–Tate theorem
(`TauCeti.FormalGroupIso.eq_of_map_residue_eq`).

Not statable at the pins, and stated nowhere in this file: Quillen's
theorem `L ≅ MU_*` and Thom's computation of `π_*MO` (the pinned Tau Ceti
has the category `TauCeti.SymmetricSpectrum` of symmetric spectra, but no
stable equivalences, stable homotopy groups or stable homotopy category, and
no `MU`, `MO` or Eilenberg–MacLane spectra); the Conner–Floyd and graded
Eilenberg–MacLane comparisons for `MO` (no `MO`, no graded Eilenberg–MacLane
spectrum `H(MO_*)`, no represented homology theories); the Landweber exact
functor theorem (no `MU_*MU`-comodules, and no comodules over Tau Ceti's
Lazard Hopf algebroid); the Devinatz–Hopkins–Smith nilpotence theorem and
the Hopkins–Smith thick-subcategory classification and periodicity theorem
(no stable homotopy category, no finite `p`-local spectra, no Morava
`K(n)`); the Hopkins–Ravenel smashing theorem, the chromatic fracture square
and the `K(n)`-local completion formula (no homological Bousfield
localizations of spectra, no `E(n)`- or `K(n)`-local categories, no homotopy
limits of spectra); the Greenlees–Sadofsky/Kuhn Tate vanishing (no Morava
`K(n)`, no Tate construction); the torus Euler cancellation of F6.6 (no
`MU`-module families over `BT`, no Thom-cocone Euler maps); and the
module-extension nullhomotopy lemma of F6.7 (no `MU`-module families over
`BT`, no extension classification).
-/

@[expose] public section

noncomputable section
namespace TauCetiRoadmap.BordismFormalGroups

universe u v w

open IsLocalRing

/-! ## Layer 1: F1. Formal-group algebra and universality -/

/-- F1 (Lazard): over a separably closed field `k` of characteristic `p`, two commutative
one-dimensional formal groups are isomorphic exactly when their heights agree, the infinite
height (the class of the additive group) included (Ravenel, Theorem A2.2.12). The forward
direction and the infinite-height case are theorems of the pinned Tau Ceti
(`TauCeti.FormalGroupIso.height_eq`, `FormalGroup.height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`);
the finite-height converse needs the separable closure. -/
theorem nonempty_formalGroupIso_iff_height_eq {k : Type*} [Field k] [IsSepClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm] :
    Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p := by
  sorry

/-! ## Layer 5: F5. Exact functors, deformations and elliptic inputs -/

/-- F5 (Landweber, Morava): a homogeneous ideal `I` of the Lazard ring `L` is prime and
invariant under the Hopf algebroid `(L, L[b₁, b₂, …])` of strict coordinate changes, that is,
its extensions along the right unit and the left unit `MvPolynomial.C` agree, exactly when it is
a height ideal `I_(p,n)` of the universal formal group law for a prime `p` and some `n ≥ 0`
(with `I_(p,0) = 0`), or their union `I_(p,∞)` (Ravenel, *Complex Cobordism*,
Theorem 1.3.16(iv), p. 17; Theorem 4.3.2(iv), p. 121, for `BP_*`). Invariance of every
`I_(p,n)` is `TauCeti.LazardRing.map_rightUnit_heightIdeal`. -/
theorem isPrime_and_invariant_iff_eq_heightIdeal {I : Ideal TauCeti.LazardRing}
    (hI : I.IsHomogeneous TauCeti.LazardRing.grading) :
    (I.IsPrime ∧ I.map TauCeti.LazardRing.rightUnit = I.map MvPolynomial.C) ↔
      ∃ p : ℕ, p.Prime ∧
        ((∃ n : ℕ, I = TauCeti.LazardRing.formalGroup.heightIdeal p n) ∨
          I = ⨆ n, TauCeti.LazardRing.formalGroup.heightIdeal p n) := by
  sorry

/-- F5 (Lubin–Tate): let `k` be a field of characteristic `p`, `R` a commutative ring with a
surjection `π₀ : R → k`, and `F₀` a commutative formal group over `k` of finite height `h`.
There is a commutative lift `Γ` of `F₀` over `R[[u₁,…,u_{h−1}]]` that is a universal
deformation: for every complete Noetherian local `R`-algebra `A` whose residue field receives
`k` compatibly with `π₀` (`ι`), and every commutative formal group `G` over `A` reducing to `F₀`
along `ι`, there is exactly one `R`-algebra map `φ` out of `R[[u₁,…,u_{h−1}]]` sending every
`u_i` into the maximal ideal of `A` for which `Γ.map φ` is ⋆-isomorphic to `G`, that is,
isomorphic by an isomorphism whose reduction is the identity series (Lubin–Tate 1966,
Proposition 1.1, p. 50, and Theorem 3.1, p. 56, with §3.2). The ⋆-isomorphism itself is then
unique by `TauCeti.FormalGroupIso.eq_of_map_residue_eq`. For a perfect field `k`, `R` may be
the Witt vectors `W(k)` with `π₀ = WittVector.constantCoeff`. -/
theorem exists_universal_deformation {p : ℕ} [Fact p.Prime] {k : Type u} [Field k] [CharP k p]
    {R : Type v} [CommRing R] (π₀ : R →+* k) (hπ₀ : Function.Surjective π₀)
    (F₀ : FormalGroup k) [F₀.IsComm] {h : ℕ} (hh : F₀.height p = h) :
    ∃ Γ : FormalGroup (MvPowerSeries (Fin (h - 1)) R), Γ.IsComm ∧
      Γ.map (π₀.comp MvPowerSeries.constantCoeff) = F₀ ∧
      ∀ (A : Type w) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
        [IsAdicComplete (maximalIdeal A) A] [Algebra R A] (ι : k →+* ResidueField A),
        (residue A).comp (algebraMap R A) = ι.comp π₀ →
        ∀ (G : FormalGroup A) [G.IsComm], G.map (residue A) = F₀.map ι →
        ∃! φ : MvPowerSeries (Fin (h - 1)) R →ₐ[R] A,
          (∀ i, φ (MvPowerSeries.X i) ∈ maximalIdeal A) ∧
            ∃ e : TauCeti.FormalGroupIso (Γ.map φ.toRingHom) G,
              PowerSeries.map (residue A) e.toHom.toPowerSeries = PowerSeries.X := by
  sorry

end TauCetiRoadmap.BordismFormalGroups
