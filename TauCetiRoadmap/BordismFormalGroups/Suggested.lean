module

public import Mathlib

/-!
# Bordism, formal groups and chromatic operations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the few definitions needed to state them.

Statable at the pins, and stated below: the exponent-two normalized
logarithm of F1 and Lazard's height classification of F1, through the
`n`-series recursion `formalNSeries`, the height `formalHeight` and the
isomorphism predicate `IsFormalGroupIso`.

Not statable at the pins, and stated nowhere in this file: Lazard's
polynomial theorem `L ≅ ℤ[x₁, x₂, …]` and the universality of `L` (no
Lazard ring at the pins); Quillen's theorem `L ≅ MU_*` and Thom's
computation of `π_*MO` (no spectra, no `MU`, `MO` or Eilenberg–MacLane
spectra); the Landweber exact functor theorem (no `MU_*MU`-comodules); the
Devinatz–Hopkins–Smith nilpotence theorem (no stable homotopy category);
the Greenlees–Sadofsky/Kuhn Tate vanishing (no Morava `K(n)`, no Tate
construction).
-/

@[expose] public section

noncomputable section
namespace TauCetiRoadmap.BordismFormalGroups
variable {R : Type*} [CommRing R]

/-! ## F1: formal-group algebra and universality -/

/-- F1: the `n`-series `[n]_F(X)` on the native `PowerSeries R` carrier, by the
substitution recursion `[0]_F = 0`, `[n+1]_F = F([n]_F, X)`. -/
def formalNSeries (F : FormalGroup R) : ℕ → PowerSeries R
  | 0 => 0
  | n + 1 => F.toPowerSeries.subst ![formalNSeries F n, PowerSeries.X]

/-- The univariate coordinate `X` as a point of the formal group. -/
def formalVariable (F : FormalGroup R) : F.Point Unit :=
  ⟨PowerSeries.X, PowerSeries.HasSubst.X ()⟩

/-- The recursion agrees with natural-number multiplication on `F.Point Unit`. -/
example (F : FormalGroup R) (n : ℕ) :
    formalNSeries F n = (n • formalVariable F).val := by
  induction n with
  | zero => rfl
  | succ n ih =>
      change F.toPowerSeries.subst ![formalNSeries F n, PowerSeries.X] =
        F.toPowerSeries.subst ![(n • formalVariable F).val, PowerSeries.X]
      rw [ih]

/-- F1: for a commutative formal group `F` over a ring with `[2]_F = 0` (which forces
`2 = 0` in `R`), there is a unique strict logarithm `g(X) = X + …` with
`g(F(X,Y)) = g(X) + g(Y)` whose coefficients in the degrees `2^k`, `k ≥ 1`, vanish. -/
theorem exists_unique_normalized_exponentTwo_logarithm
    (F : FormalGroup R) [F.IsComm]
    (hexponent : formalNSeries F 2 = 0) :
    ∃! g : PowerSeries R,
      g.constantCoeff = 0 ∧ g.coeff 1 = 1 ∧
      (∀ k : ℕ, 0 < k → g.coeff (2 ^ k) = 0) ∧
      g.subst F.toPowerSeries =
        g.subst (MvPowerSeries.X (0 : Fin 2)) +
          g.subst (MvPowerSeries.X (1 : Fin 2)) := by
  sorry

/-- F1: `φ` is an isomorphism of formal groups from `F` to `G`: a substitution with zero
constant term and unit linear coefficient (hence compositionally invertible) with
`φ(F(X,Y)) = G(φ(X), φ(Y))`. -/
def IsFormalGroupIso (F G : FormalGroup R) (φ : PowerSeries R) : Prop :=
  φ.constantCoeff = 0 ∧ IsUnit (φ.coeff 1) ∧
    φ.subst F.toPowerSeries =
      G.toPowerSeries.subst ![φ.subst (MvPowerSeries.X (0 : Fin 2)),
        φ.subst (MvPowerSeries.X (1 : Fin 2))]

/-- F1: the height of `F` at `p`: the least `h` such that the coefficient of `X^(p^h)` in
`[p]_F` is nonzero, and `⊤` when no such `h` exists (in particular when `[p]_F = 0`).
Over a field of characteristic `p` the lowest-degree term of `[p]_F` has degree `p^h`,
so this is the usual height. -/
def formalHeight (F : FormalGroup R) (p : ℕ) : ℕ∞ :=
  ⨅ (h : ℕ) (_ : (formalNSeries F p).coeff (p ^ h) ≠ 0), (h : ℕ∞)

/-- F1 (Lazard): over a separably closed field of characteristic `p`, two commutative
one-dimensional formal groups are isomorphic exactly when their heights agree, the
infinite height (the additive class) included (Ravenel, Theorem A2.2.12). -/
theorem exists_formalGroupIso_iff_formalHeight_eq {k : Type*} [Field k] [IsSepClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm] :
    (∃ φ : PowerSeries k, IsFormalGroupIso F G φ) ↔
      formalHeight F p = formalHeight G p := by
  sorry

end TauCetiRoadmap.BordismFormalGroups
