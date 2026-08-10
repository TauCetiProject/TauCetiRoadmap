import Mathlib

/-!
# The Chebotarev density theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (Layers 0–13, the conventions, the worked examples, the provenance of
the existing Dirichlet-density formalisation, and the references) is in `README.md`.

Three things in this file are the conventions the roadmap most needs pinned, and they are
recorded here precisely because they are easy to get wrong:

* the Frobenius **conjugacy class** `frobeniusClass` is the public object, and it is built on
  Mathlib's `arithFrobAt` rather than on a private notion of Frobenius;
* Dirichlet density is the **ratio** `P_S(s) / P_all(s)` as `s → 1⁺`, not the
  `log (1/(s-1))`-normalised variant (which Layer 1 proves equivalent);
* the Frobenius von Mangoldt coefficient sums over pairs `(𝔭, j)` with `Frob 𝔭 ^ j = C`, and
  **not** over primes with `Frob 𝔭 = C`. The latter does not produce the logarithmic
  derivative of the character `L`-functions.

The `local instance` block below is itself a Layer-0 target: applying `arithFrobAt` to `𝓞 L`
currently requires introducing the AKLB action, `IsGaloisGroup`, and the `SMulCommClass` it
carries by hand. Tau Ceti should provide these once, globally, for `𝓞 K → 𝓞 L`.
-/

namespace TauCetiRoadmap.Chebotarev

open Filter NumberField Ideal
open scoped Topology

noncomputable section

universe u

variable (K L : Type u) [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [FiniteDimensional K L] [IsGalois K L]

/-! ## Layer 1: prime sets, Dirichlet density, and the counting functions

These are definitions, not targets: they fix the shape of everything downstream. -/

/-- The nonzero prime ideals of `𝓞 K`. Nonzeroness is part of the definition: `⊥` is prime. -/
def primeSet : Set (Ideal (𝓞 K)) := {𝔭 | 𝔭.IsPrime ∧ 𝔭 ≠ ⊥}

/-- `P_S(s) = ∑_{𝔭 ∈ S} N𝔭 ^ (-s)`, the prime-ideal Dirichlet sum of a set of primes. -/
def primeDirichletSum (S : Set (Ideal (𝓞 K))) (s : ℝ) : ℝ :=
  ∑' 𝔭 : S, (absNorm (𝔭 : Ideal (𝓞 K)) : ℝ) ^ (-s)

/-- **Dirichlet density**, normalised by the sum over all nonzero primes of `𝓞 K`. Layer 1
proves this equivalent to normalising by `log (1/(s-1))`. -/
def HasDirichletDensity (S : Set (Ideal (𝓞 K))) (δ : ℝ) : Prop :=
  Tendsto (fun s : ℝ ↦ primeDirichletSum K S s / primeDirichletSum K (primeSet K) s)
    (𝓝[>] 1) (𝓝 δ)

/-- `ϑ_S(x) = ∑_{𝔭 ∈ S, N𝔭 ≤ x} log N𝔭`, the logarithmically weighted count. -/
def primeTheta (S : Set (Ideal (𝓞 K))) (x : ℝ) : ℝ :=
  ∑ᶠ 𝔭 ∈ {𝔭 ∈ S | (absNorm 𝔭 : ℝ) ≤ x}, Real.log (absNorm 𝔭)

/-- `π_S(x) = #{𝔭 ∈ S : N𝔭 ≤ x}`. -/
def primeCount (S : Set (Ideal (𝓞 K))) (x : ℝ) : ℕ :=
  {𝔭 ∈ S | (absNorm 𝔭 : ℝ) ≤ x}.ncard

/-- The offset logarithmic integral `Li(x) = ∫_2^x dt / log t`. The lower limit `2` avoids the
singularity at `1`; only the behaviour as `x → ∞` is used. -/
def logarithmicIntegral (x : ℝ) : ℝ := ∫ t in (2 : ℝ)..x, (Real.log t)⁻¹

section Frobenius

/-! ## Layer 0: the Frobenius conjugacy class

The three instances below are the AKLB plumbing that Layer 0 should supply globally. -/

local instance : MulSemiringAction Gal(L/K) (𝓞 L) :=
  IsIntegralClosure.MulSemiringAction (𝓞 K) K L (𝓞 L)

local instance : IsGaloisGroup Gal(L/K) (𝓞 K) (𝓞 L) :=
  IsGaloisGroup.of_isFractionRing Gal(L/K) (𝓞 K) (𝓞 L) K L

local instance : SMulCommClass Gal(L/K) (𝓞 K) (𝓞 L) :=
  (inferInstance : IsGaloisGroup Gal(L/K) (𝓞 K) (𝓞 L)).commutes

/-- `𝔭` is unramified in `L`. In the Galois setting all the ramification indices above `𝔭`
agree, so Mathlib's `Ideal.ramificationIdxIn` is the right spelling. -/
def IsUnramifiedIn (𝔭 : Ideal (𝓞 K)) : Prop := ramificationIdxIn 𝔭 (𝓞 L) = 1

open Classical in
/-- **Layer 0, the public object.** The arithmetic Frobenius conjugacy class of `𝔭`, total on
`Ideal (𝓞 K)` with a junk value off the nonzero-prime locus, in the style of
`Ideal.ramificationIdxIn`. Every theorem about it carries hypotheses placing `𝔭` in that
locus; the junk value is never used bare. -/
def frobeniusClass (𝔭 : Ideal (𝓞 K)) : ConjClasses Gal(L/K) :=
  if h : ∃ 𝔓 : Ideal (𝓞 L), 𝔓.IsPrime ∧ 𝔓 ≠ ⊥ ∧ 𝔓.LiesOver 𝔭 then
    haveI := h.choose_spec.1
    haveI : Finite (𝓞 L ⧸ h.choose) :=
      Ideal.finiteQuotientOfFreeOfNeBot _ h.choose_spec.2.1
    ConjClasses.mk (arithFrobAt (𝓞 K) Gal(L/K) h.choose)
  else 1

/-- **Layer 0, the workhorse.** Any prime of `𝓞 L` above `𝔭` computes the class; this is what
lets every later proof choose its own `𝔓`. It follows from `isConj_arithFrobAt`. -/
example (𝔭 : Ideal (𝓞 K)) (𝔓 : Ideal (𝓞 L)) [𝔓.IsPrime] [𝔓.LiesOver 𝔭] (h : 𝔓 ≠ ⊥)
    [Finite (𝓞 L ⧸ 𝔓)] :
    frobeniusClass K L 𝔭 = ConjClasses.mk (arithFrobAt (𝓞 K) Gal(L/K) 𝔓) :=
  sorry

/-- The unramified primes of `K` whose Frobenius class is `C`. -/
def frobeniusPrimeSet (C : ConjClasses Gal(L/K)) : Set (Ideal (𝓞 K)) :=
  {𝔭 ∈ primeSet K | IsUnramifiedIn K L 𝔭 ∧ frobeniusClass K L 𝔭 = C}

/-- **Layer 0, splitting.** An unramified prime splits completely exactly when its Frobenius
class is trivial. -/
example (𝔭 : Ideal (𝓞 K)) (h𝔭 : 𝔭 ∈ primeSet K) (hu : IsUnramifiedIn K L 𝔭) :
    frobeniusClass K L 𝔭 = 1 ↔
      (primesOver 𝔭 (𝓞 L)).ncard = Module.finrank K L :=
  sorry

/-- **Layer 9, the coefficient convention.** The Frobenius von Mangoldt coefficient sums
`log N𝔭` over the pairs `(𝔭, j)` with `N𝔭 ^ j = n` and `Frob 𝔭 ^ j = C`. The power is taken
on a representative; `ConjClasses` carries no `Monoid` structure, and supplying the `j`-th
power of a conjugacy class (for a general monoid) is itself a Layer-0 target. -/
def frobeniusVonMangoldt (C : ConjClasses Gal(L/K)) (n : ℕ) : ℝ :=
  ∑ᶠ p ∈ {p : Ideal (𝓞 K) × ℕ | p.1 ∈ primeSet K ∧ IsUnramifiedIn K L p.1 ∧ 0 < p.2 ∧
      absNorm p.1 ^ p.2 = n ∧ ∃ σ ∈ (frobeniusClass K L p.1).carrier,
        ConjClasses.mk (σ ^ p.2) = C},
    Real.log (absNorm p.1)

/-- Nonnegativity, the hypothesis Wiener--Ikehara needs. -/
example (C : ConjClasses Gal(L/K)) (n : ℕ) : 0 ≤ frobeniusVonMangoldt K L C n := sorry

/-! ## Layer 6: the Dirichlet-density theorem -/

/-- **Chebotarev, Dirichlet-density form.** -/
example (C : ConjClasses Gal(L/K)) :
    HasDirichletDensity K (frobeniusPrimeSet K L C)
      ((Nat.card C.carrier : ℝ) / Nat.card Gal(L/K)) :=
  sorry

/-- Each Frobenius class contains infinitely many primes. -/
example (C : ConjClasses Gal(L/K)) : (frobeniusPrimeSet K L C).Infinite := sorry

/-! ## Layers 12 and 13: the prime-number-theorem form -/

/-- **Chebotarev, `ϑ`-form.** -/
example (C : ConjClasses Gal(L/K)) :
    Tendsto (fun x : ℝ ↦ primeTheta K (frobeniusPrimeSet K L C) x / x) atTop
      (𝓝 ((Nat.card C.carrier : ℝ) / Nat.card Gal(L/K))) :=
  sorry

/-- **Chebotarev, `π`-form**: `π_C(x) ~ (|C|/|G|) Li(x)`. -/
example (C : ConjClasses Gal(L/K)) :
    Tendsto (fun x : ℝ ↦
        (primeCount K (frobeniusPrimeSet K L C) x : ℝ) / logarithmicIntegral x)
      atTop (𝓝 ((Nat.card C.carrier : ℝ) / Nat.card Gal(L/K))) :=
  sorry

/-- **Natural density** among the prime ideals of `K`. -/
example (C : ConjClasses Gal(L/K)) :
    Tendsto (fun x : ℝ ↦
        (primeCount K (frobeniusPrimeSet K L C) x : ℝ) / primeCount K (primeSet K) x)
      atTop (𝓝 ((Nat.card C.carrier : ℝ) / Nat.card Gal(L/K))) :=
  sorry

end Frobenius

/-! ## Layer 9: the prime ideal theorem

The `L = K` case of the cyclotomic prime number theorem, and an acceptance criterion for the
whole development: summing the `ϑ_C`-asymptotics over the conjugacy classes must recover it. -/

example : Tendsto (fun x : ℝ ↦ primeTheta K (primeSet K) x / x) atTop (𝓝 1) := sorry

example : Tendsto (fun x : ℝ ↦ (primeCount K (primeSet K) x : ℝ) / logarithmicIntegral x)
    atTop (𝓝 1) := sorry

/-! ## Layer 7: Wiener--Ikehara

Independent of Layers 0–6, and stated in Mathlib's `LSeries` vocabulary so that it is reusable
outside this roadmap. Every theorem in its dependency cone is to be proved without `sorry`. -/

example {a : ℕ → ℝ} {A : ℝ} {G : ℂ → ℂ}
    (ha : ∀ n, 0 ≤ a n)
    (hs : ∀ s : ℂ, 1 < s.re → LSeriesSummable (fun n ↦ (a n : ℂ)) s)
    (hG : ContinuousOn G {s : ℂ | 1 ≤ s.re})
    (hEq : Set.EqOn G (fun s ↦ LSeries (fun n ↦ (a n : ℂ)) s - A / (s - 1)) {s : ℂ | 1 < s.re}) :
    Tendsto (fun N : ℕ ↦ (∑ n ∈ Finset.Icc 1 N, a n) / N) atTop (𝓝 A) :=
  sorry

/-! ## Layer 13: `Li(x) ~ x / log x`

Needed so that either normalisation of the `π_C` asymptotic is available. -/

example : Tendsto (fun x : ℝ ↦ logarithmicIntegral x / (x / Real.log x)) atTop (𝓝 1) := sorry

end

end TauCetiRoadmap.Chebotarev
