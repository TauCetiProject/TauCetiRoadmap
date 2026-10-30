import Mathlib

/-!
# String structures, string connections and the Witten genus: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti. One is statable at the
pins and is stated below with `sorry`; for the others, the missing carrier:

* S1: a String lift exists iff `c*λ = 0`, lifts form an `H³(X;ℤ)`-torsor, the map
  `λ : BSpin → K(ℤ,4)` is an 8-equivalence, and `String(n)` (n ≥ 5) is not homotopy
  equivalent to a finite-dimensional Lie group. The pins have no classifying space
  `BSpin` of the stable Spin group, no Eilenberg–Mac Lane space `K(ℤ,4)` (Tau Ceti
  has only the `K(G,1)` predicate) and no integral characteristic class `p₁` or `λ`.
* S2: `Ω₃^String ≅ Ω₃^fr ≅ ℤ/24` and the rational String bordism ring are not
  statable: there are no Thom spectra and no bordism groups. Mathlib has the
  unstable homotopy groups `π_ n X x`, so the stem `π₃S ≅ ℤ/24` of S2.3 is stated
  in its stable-range form `π_(n+3)(Sⁿ) ≅ ℤ/24` for every n ≥ 5
  (`homotopyGroup_sphere_three_stem`); the stable group itself needs a spectrum
  or a sequential colimit carrier that the pins lack.
* S3: string connections on a String structure form an affine space and their
  classes an `Ĥ³(M;ℤ)`-torsor. There is no differential cohomology and no bundle
  gerbe or 2-gerbe.
* S4: integrality and modularity of the Witten genus of a String manifold. Mathlib
  has level-one modular forms, but there is no Spin bordism ring, no twisted Dirac
  index and hence no Witten genus.
* S5: McTague's theorem that connected-`F₄` Cayley-plane bundles generate the
  kernel of the Witten genus on String bordism away from 6. There is no String
  bordism ring, no Cayley plane manifold and no compact group `F₄`.
* S6: Stolz's conjecture, the low-weight vanishing under `Ric > 0`, and the framed
  `SU(3)` and `S³` counterexamples to the refined tmf/TMF questions. Tau Ceti has
  `CovariantDerivative.ricciTensor` and Mathlib has the Levi-Civita connection, but
  there is no Witten genus and there are no spectra `tmf` or `TMF`.
-/

open scoped Topology

namespace TauCetiRoadmap.StringOrientation

/-! ## Layer 2: String bordism and the low stems -/

/-- The third stable stem in its stable range (S2.3): for every `n ≥ 5`, the homotopy
group `π_(n+3)` of the unit sphere `Sⁿ ⊂ ℝ^(n+1)`, based at the first standard basis
vector, is cyclic of order 24. By Freudenthal, these groups identify with
EllipticCohomology E4.S’s supplied stable stem `π₃S ≅ ℤ/24{ν}` and E5’s
`π₁₂(S⁹)` instance; the range `n ≥ 5` is exactly `n + 3 ≤ 2n − 2`, and
`π₇(S⁴) ≅ ℤ ⊕ ℤ/12` shows that `n = 4` must be excluded. -/
theorem homotopyGroup_sphere_three_stem (n : ℕ) (hn : 5 ≤ n) :
    Nonempty (π_ (n + 3) (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)
      ⟨EuclideanSpace.single (0 : Fin (n + 1)) (1 : ℝ), by simp⟩ ≃*
        Multiplicative (ZMod 24)) := by
  sorry

end TauCetiRoadmap.StringOrientation
