import Mathlib

/-!
# Adelic unitary groups and algebraic modular forms: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`, which states
every target of the roadmap. This file names the roadmap's headline theorems and says why none of
them is stated here against the pinned Mathlib and Tau Ceti; so nothing is stated.

Every headline is a statement about a hermitian space `V = (J, x)` with an adelic frame over a CM
field `E` (3.1): a hermitian matrix `J` over `E` together with an invertible matrix `x` over the
adeles of `E` that carries the form of `J` to a fixed diagonal sign form at the infinite places and
to the identity at the finite places, read through a CM type; and about the adelic unitary group
`G(s)` of the signs `s`, with its rational points, its Haar measure and its levels. The pinned
libraries have the ingredients: Mathlib has CM fields and their complex conjugation
(`NumberField.IsCMField`, `NumberField.IsCMField.complexConj`), the adele ring of a number field
(`NumberField.AdeleRing`) and the unitary group of matrices over a star ring
(`Matrix.unitaryGroup`); Tau Ceti has the action of field automorphisms on the finite and on the
infinite adeles (`TauCeti.GlobalNumberFields.finiteAdeleGaloisAction`,
`TauCeti.GlobalNumberFields.infiniteAdeleGaloisAction`). Neither has the spaces with an adelic
frame, the groups `G(s)` with their measures and levels, or the objects built on them below.

* Landherr's theorem for spaces with adelic frames (3.3 (a)): it needs the spaces with an adelic
  frame of given signs, with the infinite adeles read as copies of `ℂ` through a CM type.
* Mahler's criterion and the integral over a definite quotient as a class sum (4.4): they need
  `G(s)` with its rational points and its height (4.2), the quotient integral by a cutoff (1.1)
  and the weighted class sums (1.4).
* The cuspidality, rapid decay and finite dimension of the forms of a cusp kernel (5.4): they need
  cusp kernels on the real points `G_∞(s)` and the spaces `𝒜(V, e, K)` of forms of a type and a
  level (5.1).
* Algebraic modular forms as forms of a discrete-series type on the standard definite space
  (6.4 (a)): it needs the weight representations in the model of products of minors
  (IntegralRepresentationsOfGeneralLinearGroups §1.1), their highest vector, and the
  discrete-series kernel `e_l`, whose coefficient `c_λ` is HolomorphicDiscreteSeriesOfUnitaryGroups
  §4.1 (d).
* The comparison of traces for test functions cuspidal at a split place (7.13): it needs the
  spaces `𝒜(V, l, K)` of forms of a parameter `l` (5.1, with `e_l` as above), the action of the
  group algebra of the finite adelic group on them, and cuspidality at a split place (7.1).

Some steps are statable on Mathlib's carriers without these objects, for instance 7.12 (a), on
operators of finite-dimensional complex inner product spaces; they are not headlines, and no
signature is given for them in this file.
-/

namespace TauCetiRoadmap.ShortGRH.AdelicUnitaryGroupsAndAlgebraicModularForms

end TauCetiRoadmap.ShortGRH.AdelicUnitaryGroupsAndAlgebraicModularForms
