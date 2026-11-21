module

import Mathlib

/-!
# Endoscopic transfer and unitary trace comparison, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, and it states none, because none of them
is statable at the pins without encoding its carriers ad hoc.

The headline theorems are the following, with what each lacks at the pins.

* The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods (README §4.10;
  Leslie, Theorem 2.12): for an unramified quadratic extension `E/F` of `p`-adic fields and a
  relative elliptic datum, the indicator of `End(Λ_n)` transfers to the tensor product of the
  block lattice indicators at the reference forms and to zero otherwise. It lacks the unitary
  group of a Hermitian space over a nonarchimedean quadratic extension as a locally compact group
  with its hyperspecial Haar normalization, quotient measures on coset spaces of regular
  centralizer tori, relative and `κ`-orbital integrals, rational classes inside a stable class
  with the invariant `inv`, and the ordinary unitary transfer factor.
* The cyclic spherical endoscopic fundamental lemma (README §4.6; Leslie, Theorem 3.5): `φ ∗ e_0`
  and `ξ_E(φ) ∗ e_0` are ordinary endoscopic transfers. It lacks the spherical Hecke algebra of
  compactly supported `GL_n(O_E)`-biinvariant functions on `GL_n(E)` with its convolution, the
  spherical module on invertible Hermitian matrices, the twisted Levi map, and ordinary Lie
  transfer with its factor.
* The adjacent-rank spherical Jacquet–Rallis comparison (README §4.4; Leslie, Theorem 5.3).
  It lacks Jacquet–Rallis matching, `η`-twisted orbital integrals for `GL_{n-1}(F)`-conjugation
  and unitary orbital integrals, and unramified base change of spherical functions.
* Hironaka's spherical Fourier isomorphism (README §2.3; Hironaka, Theorem 2), normalized so that
  it intertwines the Hecke action with base change. It lacks Hironaka's spherical functions on
  Hermitian matrices as rational functions of the spectral variables, the spherical Hecke algebra
  of `GL_n(F)`, and the normalized Satake transform.
* The Fourier-defined Levi operator on the full spherical module (README §5.1). It lacks the
  same carriers as Hironaka's isomorphism.
-/

namespace TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII

end TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII
