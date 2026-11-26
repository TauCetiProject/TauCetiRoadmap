import Mathlib

/-!
# Roadmap: Galois representations of unitary eigenforms: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, for the reasons below; so nothing is stated here.

Every headline is a statement about algebraic modular forms on the unitary group of the standard
definite hermitian space over a CM field `E` (AdelicUnitaryGroupsAndAlgebraicModularForms §6.1),
with their Hecke operators at split places, and two of them (7.3; 8.2 and 8.4) are also statements
about `ℓ`-adic representations of `Gal(Ω/E)` with local conditions read in `p`-adic Hodge theory.
Mathlib has, at the pin, CM fields (`NumberField.IsCMField`), the finite adele ring of a Dedekind
domain (`IsDedekindDomain.FiniteAdeleRing`), the unitary group of matrices over a ring with involution
(`Matrix.unitaryGroup`), absolute Galois groups (`Field.absoluteGaloisGroup`) and representations
of groups; Tau Ceti has Chebotarev's density theorem
(`NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`). Neither has the finite adelic
unitary group of a CM field with its levels, algebraic modular forms on it with Hecke operators at
split places, crystalline representations defined through `B_max` with their Hodge–Tate jumps and
the linear Frobenius on periods (CrystallineRepresentationsAndKisinModules §3.1), or the filter of
most Frobenius data of 1.2.

* Every rank (7.3): every eigenform on `U(n)` has an attached `ℓ`-adic representation of rank `n`,
  compatible with it at every place where it is spherical. It needs the forms and their Hecke
  polynomials (1.1), the filter of 1.2, the local conditions of 1.3 and attachment (1.5).
* Local–global compatibility at split places (8.2, 8.4): it needs in addition the action of
  `GL_n(E_w)` on the forms with pro-`p` Iwahori eigencharacters and labels (8.1;
  IntegralRepresentationsOfGeneralLinearGroups §§5.3, 6.1), local Artin maps at places of `Ω`
  (IdelicReciprocityCountsAndCyclotomicClassGroups §2.1) and tame exponents (8.4).
* Base change of prime degree between definite unitary groups (5.9, with 5.10 and 5.11): it needs
  the forms over `E` and over a step `E′/E`, and the steps, matching local data and weak base
  change of 5.1.
* Taylor–Wiles operators (9.1): it needs the forms of principal level at auxiliary places with their
  `ℓ`-integral structure and the action of the residual general linear groups on them.

Some intermediate statements are statable on Mathlib's carriers: the reconstruction of a
representation from a function obeying every trace identity (2.3), the ultrametric
Stone–Weierstrass theorem for modules (3.1) and Hilbert 90 under tame actions (5.2). They are not
headlines, and no signature is given for them in this file.
-/

namespace TauCetiRoadmap.ShortGRH.GaloisRepresentationsOfUnitaryEigenforms

end TauCetiRoadmap.ShortGRH.GaloisRepresentationsOfUnitaryEigenforms
