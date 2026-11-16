module

import Mathlib

/-!
# Gross–Zagier formulas and arithmetic heights, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test:
it states, against the pinned Mathlib and Tau Ceti, those headline theorems of the roadmap that
are statable there, each with `sorry`, together with the few definitions they need.

The headline theorems are:

* the unramified Kudla–Rapoport identity `Int(L) = ∂Den(L)` for full-rank lattices in the
  nonsplit unramified special Hom space (Li–Zhang, Theorem 3.4.1; README §3.5);
* the almost self-dual identity `(q+1)·Int_Y(L) = ∂Den_Λ(L) − Den(L)` (Li–Zhang, Theorem 10.5.1,
  with Li–Rapoport–Zhang, Theorem 14.6.2; README §4.5);
* the exotic smooth Kudla–Rapoport identity in even rank (Li–Liu II, Theorem 2.7; README §6.8);
* the Kudla–Rapoport identity for Krämer models (He–Li–Shi–Yang, Theorem 1.3; README §8.7),
  which in rank two is He–Shi–Yang's and Shi's computation (README §7.5a), in rank three is
  He–Shi–Yang's theorem for `n = 3`, and in rank `n ≥ 4` is proved under the hypothesis
  `(H_m)`, `4 ≤ m ≤ n`, of README §8.6, the identity for lattices whose largest fundamental
  invariant is odd, for which no published proof exists (the published reduction,
  He–Li–Shi–Yang, Lemma 9.6, fails for these lattices);
* the unramified and the modified arithmetic Siegel–Weil formulas (Li–Zhang, Theorem 15.5.1;
  He–Li–Shi–Yang, Theorems 10.1–10.2; README §§13.8, 13.10), the latter at a ramified place of
  dimension `n ≥ 4` under the same hypothesis of README §8.6;
* the Chow-valued modularity of the generating series of Kudla divisors on GSpin Shimura
  varieties, and of special divisors on unitary Shimura varieties, over every totally real field
  (Yuan–Zhang–Zhang, Theorem 1.3; Liu, Theorem 3.5; README §§12.6a, 12.6b, 12.7);
* the modularity of the CM intersection series over `ℚ` for hermitian spaces of dimension
  `n ≥ 3` (Zhang, §9.1 and Corollary 10.4, with the Borcherds products of Bruinier–Howard–
  Kudla–Rapoport–Yang; README §12.9);
* the arithmetic fundamental lemma for strongly regular semisimple elements over `ℚ_p`, in its
  semi-Lie version for `p ≥ n` and in its group version for `p ≥ n + 1` and for `n ≤ 3`
  (Zhang, Theorem 15.1; README §14.5); Zhang's group statement at `p = n ≥ 5` rests on the
  passage of his Proposition 4.12(i) at `q = n`, whose proof needs `det(1 − g)` integral, which
  holds when `n ≤ 3` and need not hold when `n ≥ 4`, so it is not a headline here (README §9.5).

None of them is statable at the pins, so this file states no theorem:

* the four local identities need unitary Rapoport–Zink spaces, which are formal schemes over
  `Spf O_F̆`, their special cycles and the derived Euler characteristic of coherent sheaves on
  formal schemes; the pinned Tau Ceti has only the affine formal spectrum `Spf A` of an adic ring
  (`TauCeti.FormalScheme.Spf.carrier` with `TauCeti.FormalScheme.Spf.structureSheaf`), not
  locally noetherian formal schemes, their coherent sheaves or moduli of p-divisible groups over
  them, and Mathlib has no formal schemes. Their analytic sides need hermitian
  local representation densities over local fields, unramified and ramified, which are not at the
  pins either (Mathlib's `IsNonarchimedeanLocalField` supplies no quadratic extension, hermitian
  form or density, and Tau Ceti's `Matrix.localDensity` is the density of a symmetric matrix over
  `ℤ_[p]`, with no hermitian form and no density of one lattice in another);
* the arithmetic Siegel–Weil formulas need integral models of unitary Shimura varieties, their
  arithmetic degrees with Green currents, and the derivatives of Siegel Eisenstein series on
  `U(n,n)`; none of these is at the pins;
* the Chow-valued modularity needs canonical models of GSpin and unitary Shimura varieties over
  number fields, their special divisors, and Hilbert modular forms for the Weil representation
  with values in a finite-dimensional space; none of these is at the pins (Tau Ceti has Chow
  groups of locally noetherian schemes, `TauCeti.AlgebraicGeometry.Chow.ChowGroup`, but no Shimura
  variety to apply them to);
* the modularity of the CM intersection series needs arithmetic Chow groups of these integral
  models and derived CM cycles;
* the arithmetic fundamental lemma needs the intersection numbers of graphs on products of
  Rapoport–Zink spaces and the Jacquet–Rallis orbital integrals on `S_n` with their transfer
  factors; neither is at the pins.

No weakened substitute, bounded stand-in or data definition is stated in their place.
-/

namespace TauCetiRoadmap.GrossZagierAndArithmeticHeightsPartII

end TauCetiRoadmap.GrossZagierAndArithmeticHeightsPartII
