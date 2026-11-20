# Progress log: CrystallineCohomology

An append-only record of what landed on the CrystallineCohomology roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"438f001ee74aabe3caa77dd6f8a4eecbe1bc4fdb","prs":["forgejo:https://git.taucetiproject.org/taucetiproject/tauceti@1#628"],"roadmap":"CrystallineCohomology","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
## CrystallineCohomology: 2026-11-18 to 2026-11-19 (`438f001` to `b235000`)

The roadmap's first code opens the de Rham–Witt layer at its homological start (CR.4.1), following Bhatt–Lurie–Mathew (https://git.taucetiproject.org/taucetiproject/tauceti/pulls/628). The headline is the [saturation criterion](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Saturated.html#TauCeti.DieudonneComplex.isSaturated_iff_isIso_toNormalizedDecalage): a Dieudonné complex with p-torsion-free terms is saturated exactly when its Frobenius, viewed as a cochain map into the décalage, is an isomorphism. Behind it are the [normalized décalage](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/CochainComplex/NormalizedDecalage.html#CochainComplex.normalizedDecalage) of a complex, made of the elements whose differential is divisible by p and given the differential d/p, functorially in cochain maps; and [Dieudonné complexes](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Basic.html#TauCeti.DieudonneComplex) themselves, ℤ-graded with a Frobenius satisfying dF = pFd, whose Frobenius on a torsion-free complex is the same data as a cochain map into the décalage.

On a saturated complex the [Verschiebung](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Saturated.html#TauCeti.DieudonneComplex.IsSaturated.V) now exists, with FV = VF = p, FdV = d and Vd = p·dV, and morphisms commute with it. The iterated statement is there too: [x lies in the image of Fʳ exactly when dx is divisible by pʳ](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Saturated.html#TauCeti.DieudonneComplex.IsSaturated.mem_range_F_iterate_iff), so every cocycle lies in the image of every power of Frobenius.

The rest of CR.4.1 is still to come. That includes the cohomology of the décalage (Hⁿ(M) modulo its p-torsion) and its compatibility with filtered colimits, the description inside M[1/p], and the saturation functor with its Cartier criterion. Nothing has landed yet in any other layer.
