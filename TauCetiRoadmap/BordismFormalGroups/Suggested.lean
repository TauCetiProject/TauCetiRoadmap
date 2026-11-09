module

public import Mathlib
public import TauCeti.RingTheory.FormalGroup.Hom
public import TauCeti.RingTheory.FormalGroup.Height.Basic

/-!
# Bordism, formal groups and chromatic operations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`.

Statable at the pins, and stated below: Lazard's classification of
one-dimensional commutative formal groups over a separably closed field of
characteristic `p` by their height (F1), on Tau Ceti's bundled isomorphisms
`TauCeti.FormalGroupIso` and height `FormalGroup.height`; and the
Lubin–Tate universal deformation theorem (F5), on Mathlib's `WittVector`,
`MvPowerSeries`, complete Noetherian local rings and `FormalGroup.map`. The
rest of F1 (the `n`-series, the Lazard ring with its universality and
polynomial theorem, the symmetric cocycle lemma, the coordinate-change Hopf
algebroid, the invariant differential, logarithm and exponential, the
exponent-two normalized logarithm and its universal ring) consists of
theorems of the pinned Tau Ceti, consumed by the README and stated nowhere
here; so does the uniqueness of the ⋆-isomorphism in the Lubin–Tate theorem
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
`K(n)`, no Tate construction); and the torus Euler cancellation of F6.6 (no
`MU`-module families over `BT`, no Thom-cocone Euler maps).
-/

@[expose] public section

noncomputable section
namespace TauCetiRoadmap.BordismFormalGroups

universe u v

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

/-- F5 (Lubin–Tate): a commutative formal group `F₀` of finite height `h` over a perfect field
`k` of characteristic `p` has a commutative lift `Γ` over `W(k)[[u₁,…,u_{h−1}]]` that is a
universal deformation: for every complete Noetherian local `W(k)`-algebra `A` whose residue
field receives `k` compatibly with the structure map (`ι`), and every commutative formal group
`G` over `A` reducing to `F₀` along `ι`, there is exactly one local `W(k)`-algebra map `φ` out
of `W(k)[[u₁,…,u_{h−1}]]` for which `Γ.map φ` is ⋆-isomorphic to `G`, that is, isomorphic by an
isomorphism whose reduction is the identity series (Lubin–Tate 1966, Theorem 3.1, p. 56, and
§3.2). The ⋆-isomorphism itself is then unique by
`TauCeti.FormalGroupIso.eq_of_map_residue_eq`. -/
theorem exists_universal_deformation {p : ℕ} [Fact p.Prime] {k : Type u} [Field k] [CharP k p]
    [PerfectRing k p] (F₀ : FormalGroup k) [F₀.IsComm] {h : ℕ} (hh : F₀.height p = h) :
    ∃ Γ : FormalGroup (MvPowerSeries (Fin (h - 1)) (WittVector p k)), Γ.IsComm ∧
      Γ.map (WittVector.constantCoeff.comp MvPowerSeries.constantCoeff) = F₀ ∧
      ∀ (A : Type v) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
        [IsAdicComplete (maximalIdeal A) A] [Algebra (WittVector p k) A]
        (ι : k →+* ResidueField A),
        (residue A).comp (algebraMap (WittVector p k) A) = ι.comp WittVector.constantCoeff →
        ∀ (G : FormalGroup A) [G.IsComm], G.map (residue A) = F₀.map ι →
        ∃! φ : MvPowerSeries (Fin (h - 1)) (WittVector p k) →ₐ[WittVector p k] A,
          IsLocalHom φ ∧ ∃ e : TauCeti.FormalGroupIso (Γ.map φ.toRingHom) G,
            PowerSeries.map (residue A) e.toHom.toPowerSeries = PowerSeries.X := by
  sorry

end TauCetiRoadmap.BordismFormalGroups
